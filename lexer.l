%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
"int"           { return INT; }
"printf"        { return PRINTF; }
"while"         { return WHILE; }

\"[^\"]*\"      { yylval.sval = strdup(yytext); return STRING; }
[0-9]+          { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.sval = strdup(yytext); return ID; }

"=="            { return EQ; }
"!="            { return NEQ; }
"<="            { return LE; }
">="            { return GE; }
"<"             { return '<'; }
">"             { return '>'; }

"="             { return '='; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
";"             { return ';'; }
","             { return ','; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}' ; }

[ \t\r\n]+      { /* skip whitespace */ }
.               { return yytext[0]; }
%%

int yywrap() { return 1; }
