fs = require('fs');
FABRIC = require('Fabric').createClient();

var numStocks = 10;
var numTradingDays = 252;

var priceMeans = [];
for (var i=0; i<numStocks; ++i)
  priceMeans[i] = 25.0/numTradingDays;

var priceDevs = [];
for (var i=0; i<numStocks; ++i)
  priceDevs[i] = 25.0/numTradingDays;

//var numTrials = 1;
//var numTrials = 256;
//var numTrials = 65536;
var numTrials = 262144;
//var numTrials = 1048576;

var valueAtRisk;

var includeDir = '../..';
function includeKL(filename) {
  return fs.readFileSync(filename, 'utf8').split('%NS%').join(numStocks);
}

var mathExtFilename = includeDir + '/MathExt.kl';
FABRIC.RT.registerType('MathExt', {
  members: [],
  constructor: Object,
  klBindings: {
    filename: mathExtFilename,
    sourceCode: includeKL(mathExtFilename)
  }
});

var calcParamsFilename = includeDir + '/calcParams.kl';
var calcParamsOp = FABRIC.DG.createOperator('calcParams');
calcParamsOp.setSourceCode(calcParamsFilename, includeKL(calcParamsFilename));
calcParamsOp.setEntryPoint('calcParams');

var calcParamsBinding = FABRIC.DG.createBinding();
calcParamsBinding.setOperator(calcParamsOp);
calcParamsBinding.setParameterLayout([
  'self.numTradingDays',
  'self.priceMeans',
  'self.priceDevs',
  'self.dt',
  'self.sqrtDT',
  'self.choleskyTrans',
  'self.drifts'
  ]);

var params = FABRIC.DG.createNode("params");
params.addMember('numTradingDays', 'Size');
params.setData('numTradingDays', numTradingDays);
params.addMember('priceMeans', 'Float64['+numStocks+']');
params.setData('priceMeans', priceMeans);
params.addMember('priceDevs', 'Float64['+numStocks+']');
params.setData('priceDevs', priceMeans);
params.addMember('dt', 'Float64');
params.addMember('sqrtDT', 'Float64');
params.addMember('choleskyTrans', 'Float64['+numStocks+']['+numStocks+']');
params.addMember('drifts', 'Float64['+numStocks+']');
params.bindings.append(calcParamsBinding);

var runTrialOp = FABRIC.DG.createOperator("runTrial");
runTrial = fs.readFileSync(includeDir + '/runTrial.kl', 'utf8').split('%NS%').join(numStocks);
//console.log(runTrial);
runTrialOp.setSourceCode('runTrial.kl', runTrial);
runTrialOp.setEntryPoint('runTrial');
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
sortOp.setEntryPoint('sort');
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
