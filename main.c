#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yylineno();
extern void create_hash();
extern char* yytext;
extern int nlines;

char* tokenType(int ntoken){ //nao podemos alterar os returns do regex.l devido ao laço while na main()
    switch(ntoken){
        case 1: return "NUMERO_INT";
        case 2: return "NUMERO_REAL";
        case 3: return "SIMBOLO_PROGRAM";
        case 4: return "SIMBOLO_BEGIN";
        case 5: return "SIMBOLO_END";
        case 6: return "SIMBOLO_CONST";
        case 7: return "SIMBOLO_VAR";
        case 8: return "SIMBOLO_REAL";
        case 9: return "SIMBOLO_INTEGER";
        case 10: return "SIMBOLO_PROCEDURE";
        case 11: return "SIMBOLO_ELSE";
        case 12: return "SIMBOLO_READ";
        case 13: return "SIMBOLO_WRITE";
        case 14: return "SIMBOLO_WHILE";
        case 15: return "SIMBOLO_IF";
        case 16: return "SIMBOLO_THEN";
        case 17: return "SIMBOLO_DO";
        case 18: return "SIMBOLO_FOR";
        case 19: return "SIMBOLO_TO";
        case 20: return "IGUAL";
        case 21: return "PONTO_VIRGULA";
        case 22: return "SIMBOLO_VIRGULA";
        case 23: return "DOIS_PONTOS";
        case 24: return "MULT";
        case 25: return "DIV";
        case 26: return "SOMA";
        case 27: return "SUB";
        case 28: return "SIMBOLO_APAR";
        case 29: return "SIMBOLO_FPAR";
        case 30: return "DIFERENTE";
        case 31: return "MAIOR_IGUAL";
        case 32: return "MENOR_IGUAL";
        case 33: return "MAIOR";
        case 34: return "MENOR";
        case 35: return "PONTO";
        case 36: return "IDENT";
        case 37: return "ATRIBUICAO";
        default: return "";
    }
    return "";
}

int main(int argc, char const *argv[]) {
	create_hash();
  int ntoken, vtoken;
  FILE *fp = fopen("tokens.txt", "w+");

  ntoken = yylex();
  // Função principal, futuramente substituida pelo analisador sintático
  while(ntoken){
    // Tratar os erros aqui!
    //tratando tamanho dos identificadores
    if((ntoken == 36) && (strlen(yytext) > 32)){
        printf("Tamanho do identificador incompativel: %s\n", yytext);
        fprintf(fp, "%s - ERRO_TAMANHO_ID\n", yytext);
    }
    else if(ntoken == -1){
        printf("%s - ERRO\n", yytext);
        fprintf(fp, "%s - ERRO\n", yytext);
    }
    else{
        fprintf(fp, "%s - %s\n", yytext, tokenType(ntoken));
    }

    ntoken = yylex();
  }

  fclose(fp);
  return 0;
}
