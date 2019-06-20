#include "syntactic_analyser.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yylineno();
extern void create_hash();
extern char* yytext;
extern int nlines;

int yyparse();




