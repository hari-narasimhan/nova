// Parser grammar for nova

%{
  var nodes = require('./nodes');
%}

// Based on [MDN Operator Precedence table]
// (https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence).
%left  ','
%right '='
%left  '||'
%left  '&&'
%left  '==' '!=' '===' '!=='
%left  '>' '>=' '<' '<='
%left  '+' '-'
%left  '*' '/'
%right '!'
%right NEW
%right '.'

%start program  // Tell which rule to start with.

%%

program:
  statements EOF
;

statements:
  statement
| statements terminator statement
| statements terminator
|
;

terminator:
  NEWLINE
;

statement:
  expression
;

expression:
  literal
| variable
| property
| operator
| call
| arrayLiteral
| '(' expression ')'
;

literal:
  NUMBER
| STRING
| TRUE
| FALSE
| "{" "}"
;


call:
  IDENTIFIER "(" arguments ")"
| expression "." IDENTIFIER "(" arguments ")"
;

arguments:
  expression
| arguments "," expression
|
;

variable:
  IDENTIFIER
| IDENTIFIER "=" expression
;

property:
  expression "." IDENTIFIER
| expression "." IDENTIFIER
  "=" expression
;

arrayLiteral:
  "[" "]"
| "[" elision "]"
| "[" elementList "]"
;

elision:
  ","
| elision ","
;

elementList:
  expression
| elision expression
| elementList "," expression
| elementList "," elision expression
;

operator:
  expression "+" expression
| expression "-" expression
| expression "*" expression
| expression "/" expression
| expression "===" expression
| expression "!==" expression
| expression "<=" expression
| expression ">=" expression
;
