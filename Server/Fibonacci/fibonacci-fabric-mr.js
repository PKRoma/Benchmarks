fabric = require('Fabric');
http = require('http');
fs = require('fs');

var fabricClient = fabric.createClient();

var fibonacciGeneratorOperator = fabricClient.KLC.createValueGeneratorOperator(
  "fibonacci-mr.kl",
  fs.readFileSync("fibonacci-mr.kl", "utf8"),
  "fibonacci"
  );

http.createServer(function (req, res) {
  var fibonacciGenerator = fabricClient.MR.createValueGenerator(
    fibonacciGeneratorOperator,
    fabricClient.MR.createConstValue('Integer', 40)
    );
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end("\n"+fibonacciGenerator.produce()+"\n");
}).listen(1337, "127.0.0.1");
