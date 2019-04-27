#include <stdio.h>

extern int yylex();
extern int yylineno();
extern char* yytext;
extern int nlines;


int main(int argc, char const *argv[]) {
  int ntoken, vtoken;

  ntoken = yylex();

  while(ntoken){
    printf("Linha %d: ", nlines);
    printf("%d ", ntoken);
    printf("%s\n", yytext);


    ntoken = yylex();
  }


  return 0;
}
