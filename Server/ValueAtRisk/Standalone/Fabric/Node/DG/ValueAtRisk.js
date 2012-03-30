fs = require('fs');
MathExt = require('../../../Node/MathExt.js');
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
console.log("priceCorrelations:");
console.log(priceCorrelations);

var priceCovariance = [];
for (var i=0; i<numStocks; ++i) {
  priceCovariance[i] = [];
  for (var j=0; j<numStocks; ++j) {
    priceCovariance[i][j] = priceDevs[i] * priceDevs[j] * priceCorrelations[i][j];
  }
}
console.log("priceCovariance:");
console.log(priceCovariance);

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
var params = FABRIC.DG.createNode("params");
params.addMember('numTradingDays', 'Size', numTradingDays);
params.addMember('dt', 'Float64', dt);
params.addMember('sqrtDT', 'Float64', sqrtDT);
params.addMember('choleskyTrans', 'Float64['+numStocks+']['+numStocks+']');
params.setData('choleskyTrans', choleskyTrans);
params.addMember('drifts', 'Float64['+numStocks+']');
params.setData('drifts', drifts);

var includeDir = '../..';

var runTrialOp = FABRIC.DG.createOperator("runTrial");
runTrial = fs.readFileSync(includeDir + '/runTrial.kl', 'utf8').split('%NS%').join(numStocks);
//console.log(runTrial);
runTrialOp.setSourceCode('runTrial.kl', runTrial);
runTrialOp.setEntryFunctionName('runTrial');
if (runTrialOp.getDiagnostics().length > 0 ) {
  console.log(runTrialOp.getDiagnostics());
  throw "Compile errors, aborting";
}

var runTrialBinding = FABRIC.DG.createBinding();
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

var sortOp = FABRIC.DG.createOperator("sort");
sort = fs.readFileSync(includeDir + '/sort.kl', 'utf8').split('%NS%').join(numStocks);
//console.log(sort);
sortOp.setSourceCode('sort.kl', sort);
sortOp.setEntryFunctionName('sort');
if (sortOp.getDiagnostics().length > 0 ) {
  console.log(sortOp.getDiagnostics());
  throw "Compile errors, aborting";
}

var sortBinding = FABRIC.DG.createBinding();
sortBinding.setOperator(sortOp);
sortBinding.setParameterLayout([
  'self.value<>'
]);

var trials = FABRIC.DG.createNode('trials');
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
console.log("ValueAtRisk = " + valueAtRisk);

FABRIC.close();
