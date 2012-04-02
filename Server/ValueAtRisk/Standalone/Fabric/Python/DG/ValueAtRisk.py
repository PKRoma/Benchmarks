import fabric
FABRIC = fabric.createClient()

numStocks = 10
numTradingDays = 252

priceMeans = []
for i in range(numStocks):
  priceMeans.append(25.0/numTradingDays)

priceDevs = [];
for i in range(numStocks):
  priceDevs.append(25.0/numTradingDays)

#numTrials = 1
#numTrials = 256
#numTrials = 65536
#numTrials = 262144
numTrials = 1048576

includeDir = '../..'
def includeKL(filename):
  f = open(filename, 'r')
  result = str(numStocks).join(f.read().split('%NS%'))
  f.close()
  return result

class EmptyObject():
  def __init__(self):
    return

mathExtFilename = includeDir + '/MathExt.kl'
FABRIC.RT.registerType('MathExt', {
  'members': [],
  'constructor': EmptyObject,
  'klBindings': {
    'filename': mathExtFilename,
    'sourceCode': includeKL(mathExtFilename)
  }
})

calcParamsFilename = includeDir + '/calcParams.kl'
calcParamsOp = FABRIC.DG.createOperator('calcParams')
calcParamsOp.setSourceCode(calcParamsFilename, includeKL(calcParamsFilename))
calcParamsOp.setEntryPoint('calcParams')

calcParamsBinding = FABRIC.DG.createBinding()
calcParamsBinding.setOperator(calcParamsOp)
calcParamsBinding.setParameterLayout([
  'self.numTradingDays',
  'self.priceMeans',
  'self.priceDevs',
  'self.dt',
  'self.sqrtDT',
  'self.choleskyTrans',
  'self.drifts'
  ])

params = FABRIC.DG.createNode("params")
params.addMember('numTradingDays', 'Size')
params.setData('numTradingDays', numTradingDays)
params.addMember('priceMeans', 'Float64['+str(numStocks)+']')
params.setData('priceMeans', priceMeans)
params.addMember('priceDevs', 'Float64['+str(numStocks)+']')
params.setData('priceDevs', priceMeans)
params.addMember('dt', 'Float64')
params.addMember('sqrtDT', 'Float64')
params.addMember('choleskyTrans', 'Float64['+str(numStocks)+']['+str(numStocks)+']')
params.addMember('drifts', 'Float64['+str(numStocks)+']')
params.bindings.append(calcParamsBinding)

runTrialFilename = includeDir + '/runTrial.kl'
runTrialOp = FABRIC.DG.createOperator("runTrial");
runTrialOp.setSourceCode(runTrialFilename, includeKL(runTrialFilename))
runTrialOp.setEntryPoint('runTrial');
if len(runTrialOp.getDiagnostics()) > 0:
  print runTrialOp.getDiagnostics()
  raise Exception("Compile errors, aborting")

runTrialBinding = FABRIC.DG.createBinding()
runTrialBinding.setOperator(runTrialOp)
runTrialBinding.setParameterLayout([
  'self.index',
  'params.numTradingDays',
  'params.dt',
  'params.sqrtDT',
  'params.choleskyTrans',
  'params.drifts',
  'self.value'
])

sortFilename = includeDir + '/sort.kl'
sortOp = FABRIC.DG.createOperator("sort")
sortOp.setSourceCode(sortFilename, includeKL(sortFilename))
sortOp.setEntryPoint('sort');
if len(sortOp.getDiagnostics()) > 0:
  print sortOp.getDiagnostics()
  raise Exception("Compile errors, aborting")

sortBinding = FABRIC.DG.createBinding()
sortBinding.setOperator(sortOp)
sortBinding.setParameterLayout([
  'self.value<>'
])

trials = FABRIC.DG.createNode('trials')
trials.setCount(numTrials)
trials.setDependency(params, 'params')
trials.addMember('value', 'Float64')
trials.bindings.append(runTrialBinding)
trials.bindings.append(sortBinding)
if len(trials.getErrors()) > 0:
  print trials.getErrors()
  raise Exception("DG errors, aborting")
trials.evaluate()

valueAtRisk = (numStocks * 100.0) - trials.getData('value', int(round(numTrials*0.05)))
print "ValueAtRisk = " + str(valueAtRisk)

FABRIC.close()
