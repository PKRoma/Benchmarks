import array
import sys
import fabric
import math
import BaseHTTPServer
import urlparse
import MathExt

# shutdown server after maxRequests requests
maxRequests = 20

useFabric = False
debug = False
fabricClients = []
numRequests = 0

if len( sys.argv ) > 1:
  if sys.argv[1] == '-f':
    useFabric = True
  else:
    print 'invalid command line flag'
    sys.exit(1)

class VARServer( BaseHTTPServer.HTTPServer ):
  # don't shut down the connection after do_GET (waiting for callback)
  def shutdown_request( self, request ):
    pass

class VARHandler( BaseHTTPServer.BaseHTTPRequestHandler ):
  def writeHeader( self, code ):
    self.send_response( code )
    self.send_header( 'Content-type', 'text/plain' )
    self.end_headers()

  # finally close connection
  def close( self ):
    if not self.wfile.closed:
      self.wfile.flush()
    self.wfile.close()
    self.rfile.close()
    try:
      self.request.shutdown()
    except Exception:
      self.request.close()

  # do not allow stream to be closed immediately, wait for
  # async callback to return
  def finish( self ):
    pass

  def do_GET( self ):
    global numRequests
    numRequests += 1

    numTradingDays = 252
    dt = 1.0/numTradingDays
    sqrtDT = math.sqrt(dt)
 
    query = urlparse.parse_qs(urlparse.urlparse(self.path).query)
  
    numStocks = 0
    initialPrices = []
    priceMeans = []
    priceDevs = []
    priceCorrs = []
    while True:
      i = numStocks
      initialPriceName = "ip_"+str(i+1)
      priceMeanName = "pm_"+str(i+1)
      priceDevName = "pd_"+str(i+1)
      if initialPriceName in query and priceMeanName in query and priceDevName in query:
        initialPrices.insert(i, float(query[initialPriceName][0]))
        priceMeans.insert(i, float(query[priceMeanName][0]) / numTradingDays)
        priceDevs.insert(i, float(query[priceDevName][0]) / numTradingDays)
        priceCorrs.insert(i, [])
        for j in range(0, numStocks):
          priceCorrelationName = "pc_" + str(j+1) + "_" + str(i+1)
          if priceCorrelationName in query:
            priceCorrs[i].insert(j, float(query[priceCorrelationName][0]))
          else:
            priceCorrs[i].insert(j, 0.0)
          priceCorrs[j].insert(i, priceCorrs[i][j])
        priceCorrs[i].insert(i, 1.0)
        numStocks += 1
      else:
        break
  
    if numStocks <= 0:
      self.writeHeader( 400 )
      self.wfile.write("You must provide at least one stock!\n")
    else:
      if debug:
        print("priceMeans:")
        print(priceMeans)
        print("priceDevs:")
        print(priceDevs)
        print("priceCorrs:")
        print(priceCorrs)
  
      priceCovariance = []
      for i in range(0, numStocks):
        priceCovariance.insert(i, [])
        for j in range(0, numStocks):
          priceCovariance[i].insert(j, priceDevs[i] * priceDevs[j] * priceCorrs[i][j])
  
      choleskyTrans = MathExt.choleskyTrans(priceCovariance)
  
      drifts = []
      for i in range(0, numStocks):
        drifts.insert(i, priceMeans[i] - priceCovariance[i][i]/2)
  
      totalInitialPrice = 0.0
      for i in range(0, numStocks):
        totalInitialPrice += initialPrices[i]
  
      numTrials = 16384
  
      if useFabric:
        fabricClient = fabric.createClient()
        fabricClients.append( fabricClient )

        params = fabricClient.DG.createNode("params")
        params.addMember('numTradingDays', 'Size', numTradingDays)
        params.addMember('dt', 'Float64', dt)
        params.addMember('sqrtDT', 'Float64', sqrtDT)
        params.addMember('initialPrices', 'Float64['+str(numStocks)+']')
        params.addMember('choleskyTrans', 'Float64['+str(numStocks)+']['+str(numStocks)+']')
        params.setData('choleskyTrans', choleskyTrans)
        params.addMember('drifts', 'Float64['+str(numStocks)+']')
        params.setData('drifts', drifts)

        runTrialOp = fabricClient.DG.createOperator("runTrial")
        runTrial = str(numStocks).join( open('runTrial.kl').read().split('%NS%') )
        #print(runTrial)
        runTrialOp.setSourceCode('runTrial.kl', runTrial)
        runTrialOp.setEntryFunctionName('runTrial')
        if len( runTrialOp.getDiagnostics() ) > 0:
          print(runTrialOp.getDiagnostics())
          raise Exception( "Compile errors, aborting" )

        runTrialBinding = fabricClient.DG.createBinding()
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

        sortOp = fabricClient.DG.createOperator("sort")
        sort = str(numStocks).join( open('sort.kl').read().split('%NS%') )
        #print(sort)
        sortOp.setSourceCode('sort.kl', sort)
        sortOp.setEntryFunctionName('sort')
        if len( sortOp.getDiagnostics() ) > 0:
          print(sortOp.getDiagnostics())
          raise Exception(  "Compile errors, aborting" )

        sortBinding = fabricClient.DG.createBinding()
        sortBinding.setOperator(sortOp)
        sortBinding.setParameterLayout([
          'self.value<>'
        ])

        trials = fabricClient.DG.createNode('trials')
        trials.setCount(numTrials)
        trials.setDependency(params, 'params')
        trials.addMember('value', 'Float64')
        trials.bindings.append(runTrialBinding)
        trials.bindings.append(sortBinding)
        if len( trials.getErrors() ) > 0:
          print(trials.getErrors())
          raise Exception( "DG errors, aborting" )

        def callback():
          valueAtRisk = totalInitialPrice - trials.getData('value', int(round(numTrials*0.05)))
          self.writeHeader( 200 )
          self.wfile.write(str(valueAtRisk) + "\n")
          fabricClient.close()
          fabricClients.remove( fabricClient )
          self.close()

        trials.evaluateAsync( callback )
      else:
        prng = MathExt.Random.ExpGenerator
  
        trialResults = []
        for trial in range(0, numTrials):
          prng.seed(4096*(1+trial))
  
          #print("trial="+trial+" numTradingDays="+numTradingDays+" dt="+dt+" sqrtDT="+sqrtDT)
          #print("choleskyTrans="+choleskyTrans)
          #print("drifts="+drifts)
          amounts = []
          for i in range(0, numStocks):
            amounts.insert(i, initialPrices[i])
 
          for day in range(1, numTradingDays+1):
            Z = MathExt.normalVec(numStocks, prng)
            #print("Z = "+Z)
            X = MathExt.mat.mulVec(choleskyTrans, Z)
            #print("X = "+X)
            for i in range(0, numStocks):
              amounts[i] *= math.exp(drifts[i]*dt + X[i]*sqrtDT)
  
          value = 0.0
          for i in range(0, numStocks):
            value += amounts[i]
          trialResults.append(value)
  
        def sort(v):
          def partition(a, begin, end, pivot): 
            piv = a[pivot]
            a[pivot] = a[end-1]
            a[end-1] = piv
            store = begin
            for i in range(begin, end-1):
              if a[i] <= piv:
                t = a[store]
                a[store] = a[i]
                a[i] = t
                store += 1
            t = a[end-1]
            a[end-1] = a[store]
            a[store] = t
            return store
  
          def qsort(a, begin, end):
            if end - begin <= 1:
              return
            else:
              pivot = partition(a, begin, end, begin+int(round((end-begin)/2)))
              qsort(a, begin, pivot)
              qsort(a, pivot+1, end)
  
          return qsort(v, 0, len(v))
  
        sort(trialResults)
        valueAtRisk = totalInitialPrice - trialResults[int(round(numTrials*0.05))]
        self.writeHeader( 200 )
        self.wfile.write( str(valueAtRisk) + "\n" )
        self.close()

httpd = VARServer( ('', 1337), VARHandler )
print('Server running at http://127.0.0.1:1337/')

if useFabric:
  # XXX initial Python alpha is not truly async, will be fixed in next release
  httpd.timeout = 0.1
  while numRequests < maxRequests:
    for c in fabricClients:
      c.running()
    httpd.handle_request()
else:
  while numRequests < maxRequests:
    httpd.handle_request()

