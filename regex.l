%{
#include <stdio.h>
#include <stdlib.h>
int nlines=0;
%}

NUMERO_INT [0-9]
NUMERO_REAL {NUMERO_INT}+"."{NUMERO_INT}+
IDENT [a-zA-Z][a-zA-Z0-9_]*
COMENTARIO ["{"][ \ta-zA-Z_]*["}"]
%%

[ \t]     ;
{COMENTARIO}  ;

{NUMERO_INT}+ {printf("<'%d', NUMERO_INT>\n", atoi(yytext));}
{NUMERO_REAL} {printf("<'%f', NUMERO_REAL>\n", atof(yytext));}

"program" {printf("<%s, SIMBOLO_PROGRAM>\n", yytext);}
"begin" {printf("<%s, SIMBOLO_BEGIN>\n", yytext);}
"end" {printf("<%s, SIMBOLO_END>\n", yytext);}
"const" {printf("<%s, SIMBOLO_CONST>\n", yytext);}
"var" {printf("<%s, SIMBOLO_VAR>\n", yytext);}
"real" {printf("<%s, SIMBOLO_REAL>\n", yytext);}
"integer" {printf("<%s, SIMBOLO_INTEGER>\n", yytext);}
"procedure" {printf("<%s, SIMBOLO_PROCEDURE>\n", yytext);}
"else" {printf("<%s, SIMBOLO_ELSE>\n", yytext);}
"read" {printf("<%s, SIMBOLO_READ>\n", yytext);}
"write" {printf("<%s, SIMBOLO_WRITE>\n", yytext);}
"while" {printf("<%s, SIMBOLO_WHILE>\n", yytext);}
"if" {printf("<%s, SIMBOLO_IF>\n", yytext);}
"then" {printf("<%s, SIMBOLO_THEN>\n", yytext);}
"do" {printf("<%s, SIMBOLO_DO>\n", yytext);}
":=" {printf("<%s, ATRIBUICAO>\n", yytext);}
"=" {printf("<%s, IGUAL>\n", yytext);}
";" {printf("<%s, PONTO_VIRGULA>\n", yytext);}
"," {printf("<%s, SIMBOLO_VIRGULA>\n", yytext);}
":" {printf("<%s, DOIS_PONTOS>\n", yytext);}
"*" {printf("<%s, MULT>\n", yytext);}
"/" {printf("<%s, DIV>\n", yytext);}
"+" {printf("<%s, SOMA>\n", yytext);}
"-" {printf("<%s, SUB>\n", yytext);}
"(" {printf("<%s, SIMBOLO_APAR>\n", yytext);}
")" {printf("<%s, SIMBOLO_FPAR>\n", yytext);}
"<>" {printf("<%s, DIFERENTE>\n", yytext);}
">=" {printf("<%s, MAIOR_IGUAL>\n", yytext);}
"<=" {printf("<%s, MENOR_IGUAL>\n", yytext);}
">" {printf("<%s, MAIOR>\n", yytext);}
"<" {printf("<%s, MENOR>\n", yytext);}
"." {printf("<%s, PONTO>\n", yytext);}

{IDENT} {printf("<%s, IDENT>\n", yytext);}
"\n" {nlines++;}

%%

int main()
{
yylex();
printf("\nNumero linhas analizadas: %d\n", nlines);
return 0;
}
