%{
#include <stdio.h>
#include <stdlib.h>
int nlines=1, ntoken;
%}

NUMERO_INT [0-9]
NUMERO_REAL {NUMERO_INT}+"."{NUMERO_INT}+
IDENT [a-zA-Z][a-zA-Z0-9_]*
COMENTARIO ["{"][ \ta-zA-Z_]*["}"]
%%

[ \t]     ;
{COMENTARIO}  ;
{NUMERO_INT}+[^{NUMERO_INT}]{NUMERO_INT}* {printf("Numero mal formatado: %s\n", yytext); return -1;} 

{NUMERO_INT}+ {printf("<'%d', NUMERO_INT>\n", atoi(yytext)); return 1;}
{NUMERO_REAL} {printf("<'%f', NUMERO_REAL>\n", atof(yytext)); return 2;}

"program" {printf("<%s, SIMBOLO_PROGRAM>\n", yytext); return 3;}
"begin" {printf("<%s, SIMBOLO_BEGIN>\n", yytext); return 4;}
"end" {printf("<%s, SIMBOLO_END>\n", yytext); return 5;}
"const" {printf("<%s, SIMBOLO_CONST>\n", yytext); return 6;}
"var" {printf("<%s, SIMBOLO_VAR>\n", yytext); return 7;}
"real" {printf("<%s, SIMBOLO_REAL>\n", yytext); return 8;}
"integer" {printf("<%s, SIMBOLO_INTEGER>\n", yytext); return 9;}
"procedure" {printf("<%s, SIMBOLO_PROCEDURE>\n", yytext); return 10;}
"else" {printf("<%s, SIMBOLO_ELSE>\n", yytext); return 11;}
"read" {printf("<%s, SIMBOLO_READ>\n", yytext); return 12;}
"write" {printf("<%s, SIMBOLO_WRITE>\n", yytext); return 13;}
"while" {printf("<%s, SIMBOLO_WHILE>\n", yytext); return 14;}
"if" {printf("<%s, SIMBOLO_IF>\n", yytext); return 15;}
"then" {printf("<%s, SIMBOLO_THEN>\n", yytext); return 16;}
"do" {printf("<%s, SIMBOLO_DO>\n", yytext); return 17;}
":=" {printf("<%s, ATRIBUICAO>\n", yytext); return 18;}
"=" {printf("<%s, IGUAL>\n", yytext); return 19;}
";" {printf("<%s, PONTO_VIRGULA>\n", yytext); return 20;}
"," {printf("<%s, SIMBOLO_VIRGULA>\n", yytext); return 21;}
":" {printf("<%s, DOIS_PONTOS>\n", yytext); return 22;}
"*" {printf("<%s, MULT>\n", yytext); return 23;}
"/" {printf("<%s, DIV>\n", yytext); return 24;}
"+" {printf("<%s, SOMA>\n", yytext); return 25;}
"-" {printf("<%s, SUB>\n", yytext); return 26;}
"(" {printf("<%s, SIMBOLO_APAR>\n", yytext); return 27;}
")" {printf("<%s, SIMBOLO_FPAR>\n", yytext); return 28;}
"<>" {printf("<%s, DIFERENTE>\n", yytext); return 29;}
">=" {printf("<%s, MAIOR_IGUAL>\n", yytext); return 30;}
"<=" {printf("<%s, MENOR_IGUAL>\n", yytext); return 31;}
">" {printf("<%s, MAIOR>\n", yytext); return 32;}
"<" {printf("<%s, MENOR>\n", yytext); return 33;}
"." {printf("<%s, PONTO>\n", yytext); return 34;}

{IDENT} {printf("<%s, IDENT>\n", yytext); return 35;}
"\n" {nlines++;}

%%

int yywrap(void)
{
  return 1;
}
