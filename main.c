#include <stdio.h>

extern int yylex();
extern int yylineno();
extern void create_hash();
extern char* yytext;
extern int nlines;


int main(int argc, char const *argv[]) {
	create_hash();
  int ntoken, vtoken;

  ntoken = yylex();
  // Função principal, futuramente substituida pelo analisador sintático
  while(ntoken){
    printf("Linha %d: ", nlines);
    printf("tipo do token: %d ", ntoken);
    printf("token: %s\n\n", yytext);

    // Tratar os erros aqui!


    ntoken = yylex();
  }


  return 0;
}
