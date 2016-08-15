// Parser grammar for nova

%{
  var nodes = require('./src/nodes');
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
| variableDeclaration
;

expression:
  literal
| variable
| property
| operator
| '(' expression ')'
;

literal:
  NUMBER
| STRING
| TRUE
| FALSE
| "{" "}"
;

variableDeclaration:
  "@" IDENTIFIER "=" expression
| "@" IDENTIFIER
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

operator:
  expression "+" expression
| expression "-" expression
| expression "*" expression
| expression "/" expression
;
