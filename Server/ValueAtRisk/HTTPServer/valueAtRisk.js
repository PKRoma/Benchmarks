fabric = require('Fabric');
fs = require('fs');
url = require('url');
MathExt = require('./MathExt.js');

var useFabric = true;
var debug = true;

require('http').createServer(function (req, res) {
  (function (fabricClient) {
    var prng = new MathExt.random.ExpGenerator;
    prng.seed(0);

    var numTradingDays = 252;
    var dt = 1.0/numTradingDays;
    var sqrtDT = Math.sqrt(dt);

    var query = url.parse(req.url, true).query;

    var numStocks = 0;
    var priceMeans = [];
    var priceDevs = [];
    var priceCorrs = [];
    for (;;) {
      var i = numStocks;
      var priceMeanName = "pm_"+(i+1);
      var priceDevName = "pd_"+(i+1);
      if ((priceMeanName in query) && (priceDevName in query)) {
        priceMeans[i] = parseFloat(query[priceMeanName]);
        priceDevs[i] = parseFloat(query[priceDevName]) / numTradingDays;
        priceCorrs[i] = [];
        for (var j=0; j<numStocks; ++j) {
          var priceCorrelationName = "pc_" + (j+1) + "_" + (i+1);
          if (priceCorrelationName in query)
            priceCorrs[i][j] = parseFloat(query[priceCorrelationName]);
          else
            priceCorrs[i][j] = 0.0;
          priceCorrs[j][i] = priceCorrs[i][j];
        }
        priceCorrs[i][i] = 1.0;
        ++numStocks;
      }
      else break;
    }

    if (numStocks <= 0) {
      res.writeHead(400, {'Content-Type': 'text/plain'});
      res.end("You must provide at least one stock!\n");
    }
    else {
      if (debug) {
        console.log("priceMeans:");
        console.log(priceMeans);
        console.log("priceDevs:");
        console.log(priceDevs);
        console.log("priceCorrs:");
        console.log(priceCorrs);
      }

      var priceCovariance = [];
      for (var i=0; i<numStocks; ++i) {
        priceCovariance[i] = [];
        for (var j=0; j<numStocks; ++j) {
          priceCovariance[i][j] = priceDevs[i] * priceDevs[j] * priceCorrs[i][j];
        }
      }

      var choleskyTrans = MathExt.choleskyTrans(priceCovariance);

      var drifts = [];
      for (var i=0; i<numStocks; ++i)
        drifts[i] = priceMeans[i] - priceCovariance[i][i]/2;

      var numTrials = 16384;

      var valueAtRisk;
      if (useFabric) {
        var params = fabricClient.DG.createNode("params");
        params.addMember('numTradingDays', 'Size', numTradingDays);
        params.addMember('dt', 'Float64', dt);
        params.addMember('sqrtDT', 'Float64', sqrtDT);
        params.addMember('choleskyTrans', 'Float64['+numStocks+']['+numStocks+']');
        params.setData('choleskyTrans', choleskyTrans);
        params.addMember('drifts', 'Float64['+numStocks+']');
        params.setData('drifts', drifts);

        var runTrialOp = fabricClient.DG.createOperator("runTrial");
        runTrial = fs.readFileSync('runTrial.kl', 'utf8').split('%NS%').join(numStocks);
        //console.log(runTrial);
        runTrialOp.setSourceCode('runTrial.kl', runTrial);
        runTrialOp.setEntryFunctionName('runTrial');
        if (runTrialOp.getDiagnostics().length > 0 ) {
          console.log(runTrialOp.getDiagnostics());
          throw "Compile errors, aborting";
        }

        var runTrialBinding = fabricClient.DG.createBinding();
        runTrialBinding.setOperator(runTrialOp);
        runTrialBinding.setParameterLayout([
          'self.index',
          'params.numTradingDays',
          'params.dt',
          'params.sqrtDT',
          'params.choleskyTrans',
          'params.drifts',
          'self.value'
        ]);

        var sortOp = fabricClient.DG.createOperator("sort");
        sort = fs.readFileSync('sort.kl', 'utf8').split('%NS%').join(numStocks);
        //console.log(sort);
        sortOp.setSourceCode('sort.kl', sort);
        sortOp.setEntryFunctionName('sort');
        if (sortOp.getDiagnostics().length > 0 ) {
          console.log(sortOp.getDiagnostics());
          throw "Compile errors, aborting";
        }

        var sortBinding = fabricClient.DG.createBinding();
        sortBinding.setOperator(sortOp);
        sortBinding.setParameterLayout([
          'self.value<>'
        ]);

        var trials = fabricClient.DG.createNode('trials');
        trials.setCount(numTrials);
        trials.setDependency(params, 'params');
        trials.addMember('value', 'Float64');
        trials.bindings.append(runTrialBinding);
        trials.bindings.append(sortBinding);
        if (trials.getErrors().length > 0) {
          console.log(trials.getErrors());
          throw "DG errors, aborting";
        }
        trials.evaluate();

        valueAtRisk = (numStocks * 100.0) - trials.getData('value', Math.round(numTrials*0.05));
      }
      else {
        trialResults = [];
        for (var trial=0; trial<numTrials; ++trial) {
          prng.seed(4096*(1+trial));

          //console.log("trial="+trial+" numTradingDays="+numTradingDays+" dt="+dt+" sqrtDT="+sqrtDT);
          //console.log("choleskyTrans="+choleskyTrans);
          //console.log("drifts="+drifts);
          var amounts = [];
          for (var i=0; i<numStocks; ++i)
            amounts[i] = 100;

          for (var day=1; day<=numTradingDays; ++day) {
            var Z = MathExt.random.normalVec(numStocks, prng);
            //console.log("Z = "+Z);
            var X = MathExt.mat.mulVec(choleskyTrans, Z);
            //console.log("X = "+X);
            for (var i=0; i<numStocks; ++i) {
              amounts[i] *= Math.exp(drifts[i]*dt + X[i]*sqrtDT);
            }
          }

          var value = 0.0;
          for (var i=0; i<numStocks; ++i)
            value += amounts[i];
          trialResults.push(value);
        }

        var sort = function (v) {
          var partition = function (a, begin, end, pivot) {
            var piv = a[pivot];
            a[pivot] = a[end-1];
            a[end-1] = piv;
            var store = begin;
            for (var i=begin; i<end-1; ++i) {
              if (a[i] <= piv) {
                var t = a[store];
                a[store] = a[i];
                a[i] = t;
                ++store;
              }
            }
            var t = a[end-1];
            a[end-1] = a[store];
            a[store] = t;
            return store;
          };

          var qsort = function (a, begin, end) {
            if (end - begin <= 1)
              return;
            else {
              var pivot = partition(a, begin, end, begin+Math.round((end-begin)/2));
              qsort(a, begin, pivot);
              qsort(a, pivot+1, end);
            }
          };

          return qsort(v, 0, v.length);
        };

        sort(trialResults);
        valueAtRisk = (numStocks * 100.0) - trialResults[Math.round(numTrials*0.05)];
      }

      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end(valueAtRisk + "\n");
    }
  })(fabric.createClient());
}).listen(1337, "127.0.0.1");
console.log('Server running at http://127.0.0.1:1337/');

