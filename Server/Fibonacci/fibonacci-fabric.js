fabric = require('Fabric');
http = require('http');
fs = require('fs');

http.createServer(function (req, res) {
  (function (fabricClient) {
    var fibOp = fabricClient.DG.createOperator("fibonacci");
    fibOp.setSourceCode("fibonacci.kl", fs.readFileSync("fibonacci.kl", "utf8"));
    fibOp.setEntryFunctionName("fibonacci");

    var fibBinding = fabricClient.DG.createBinding();
    fibBinding.setOperator(fibOp);
    fibBinding.setParameterLayout([
      "self.n",
      "self.result"
    ]);

    var fibNode = fabricClient.DG.createNode("fibonacciNode");
    fibNode.addMember("n", "Integer");
    fibNode.addMember("result", "Integer");
    fibNode.bindings.append(fibBinding);
    fibNode.setData("n", 0, 40);

    fibNode.evaluateAsync(function () {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end("\n"+fibNode.getData("result", 0)+"\n");
      fabricClient.close();
    });
  })(fabric.createClient());
}).listen(1337, "127.0.0.1");
