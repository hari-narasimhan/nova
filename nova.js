var parser = require('./src/parser').parser;

var fs = require('fs');

var start = new Date();

var file = process.argv[2];
var code = fs.readFileSync(file, 'utf8');

// In the actual scenario
// The parse function will interpret the code and
// return a function which will take the context such as
// contract, transaction and produce a the result (cleared record)
var result = parser.parse(code);

var end = new Date();
console.log('parsing completed in ' + (end - start) + ' ms ==> result is', result);
