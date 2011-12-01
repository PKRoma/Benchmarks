fabric = require('Fabric');
http = require('http');
fs = require('fs');

var fibonacci = function (n) {
  if (n < 2)
    return 1;
  else
    return fibonacci(n-2) + fibonacci(n-1);
};

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end(fibonacci(40)+"\n");
}).listen(1337, "127.0.0.1");
