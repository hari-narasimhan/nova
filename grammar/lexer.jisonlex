// nova lexer
// The lexer defines all tokens that will be recognized by the DSL
// Note: token rules are matched from top to bottom

%%

// comments and whitespace

"#".*                   // ignore comment
\n+                     return 'NEWLINE';
\s+                     // skip whitespace

// literals
[0-9]+\.?[0-9]*\b       return 'NUMBER';
//[0-9]+\.[0-9]*\b      return 'NUMBER';
\"[^"]*\"               return 'STRING';
"true"                  return 'TRUE';
"false"                 return 'FALSE';


// keywords
"if"                    return 'IF';
"else"                  return 'ELSE';

// identifiers
[a-zA-Z_]\w*            return 'IDENTIFIER';

// operators
"==="                   return '===';
"!=="                   return '!==';
"&&"                    return '&&';
"||"                    return '||';
">"                     return '>';
">="                    return '>=';
"<"                     return '<';
"<="                    return '<=';

// catch all rule to match `+`, `-`, `(` `)` etc
.                       return yytext;

<<EOF>>                 return 'EOF';
