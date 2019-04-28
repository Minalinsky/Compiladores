#include <stdio.h>

extern int yylex();
extern int yylineno();
extern char* yytext;

int main(int argc, char const *argv[]) {
	