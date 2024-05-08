%{
#include <stdio.h>
%}

%option noyywrap

%%
\/\/.*                    { printf("COMMENT\n"); }
"p"                       { printf("print "); }
"f"                       { printf("floatdcl "); }
"i"                       { printf("intdcl "); }
[a-zA-Z][a-zA-Z0-9_]*      { printf("id "); }
[0-9]+                    { printf("inum "); }
[0-9]+"."[0-9]+           { printf("fnum "); }
"="                       { printf("assign "); }
"\+"                      { printf("plus "); }
\n                        { printf("\n"); }
[ \t]+                    /* ignore whitespace */
%%

int main() {
    yylex();
    return 0;
}