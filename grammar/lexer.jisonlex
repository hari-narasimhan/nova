// nova lexer
// The lexer defines all tokens that will be recognized by the DSL
// Note: token rules are matched from top to bottom

%%

// comments and whitespace

"#".*                   // ignore comment
\n+                     // skip newlines
\s+                     // skip whitspace

// literals
[0-9]+\b                return 'NUMBER';
[0-9]+\.[0-9]*          return 'NUMBER';
\"[^"]*\"               return 'STRING';
"true"                  return 'TRUE';
"false"                 return 'FALSE';


// keywords
/* EMPTY AS OF NOW */

// identifiers
[a-zA-Z_]\w*            return 'IDENTIFIER';

// operators
"is"                    return '===';
"isnt"                  return '!==';
"and"                   return '&&';
"or"                    return '||';
"gt"                    return '>';
"gte"                   return '>=';
"lt"                    return '<';
"lte"                   return '<=';

// catch all rule to match `+`, `-`, `(` `)`
.                       return yytext;

<<EOF>>                 return 'EOF';
