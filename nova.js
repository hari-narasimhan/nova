var parser = require('./src/parser').parser;

var fs = require('fs');

var start = new Date();

var file = process.argv[2];
var code = fs.readFileSync(file, 'utf8');

var result = parser.parse(code);

var end = new Date();
console.log('parsing completed in ' + (end - start) + ' ms ==> result is', result);
