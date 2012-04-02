fs = require('fs');
MathExt = require('./MathExt.js');
FABRIC = require('Fabric').createClient();

var prng = new MathExt.random.ExpGenerator;
prng.seed(0);

var numStocks = 10;
var numTradingDays = 252;
var dt = 1.0/numTradingDays;
var sqrtDT = Math.sqrt(dt);

var priceMeans = [];
for (var i=0; i<numStocks; ++i)
  priceMeans[i] = 25.0/numTradingDays;

var priceDevs = [];
for (var i=0; i<numStocks; ++i)
  priceDevs[i] = 25.0/numTradingDays;

var priceCorrelations = MathExt.randomCorrelation(numStocks, prng);

var priceCovariance = [];
for (var i=0; i<numStocks; ++i) {
  priceCovariance[i] = [];
  for (var j=0; j<numStocks; ++j) {
    priceCovariance[i][j] = priceDevs[i] * priceDevs[j] * priceCorrelations[i][j];
  }
}

var choleskyTrans = MathExt.choleskyTrans(priceCovariance);

var drifts = [];
for (var i=0; i<numStocks; ++i)
  drifts[i] = priceMeans[i] - priceCovariance[i][i]/2;

//var numTrials = 1;
//var numTrials = 256;
var numTrials = 65536;
//var numTrials = 262144;
//var numTrials = 1048576;

var valueAtRisk;
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
console.log("ValueAtRisk = " + valueAtRisk);

FABRIC.close();
