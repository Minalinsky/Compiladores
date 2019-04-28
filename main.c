#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yylineno();
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
        case 18: return "ATRIBUICAO";
        case 19: return "IGUAL";
        case 20: return "PONTO_VIRGULA";
        case 21: return "SIMBOLO_VIRGULA";
        case 22: return "DOIS_PONTOS";
        case 23: return "MULT";
        case 24: return "DIV";
        case 25: return "SOMA";
        case 26: return "SUB";
        case 27: return "SIMBOLO_APAR";
        case 28: return "SIMBOLO_FPAR";
        case 29: return "DIFERENTE";
        case 30: return "MAIOR_IGUAL";
        case 31: return "MENOR_IGUAL";
        case 32: return "MAIOR";
        case 33: return "MENOR";
        case 34: return "PONTO";
        case 35: return "IDENT";
        default: return "";
    }
    return "";
}

int main(int argc, char const *argv[]) {
  int ntoken, vtoken;
  FILE *fp = fopen("tokens.txt", "w+");

  ntoken = yylex();
  // Função principal, futuramente substituida pelo analisador sintático
  while(ntoken){
    // Tratar os erros aqui!
    //tratando tamanho dos identificadores
    if((ntoken == 35) && (strlen(yytext) > 32)){
        printf("%s - ERRO_TAMANHO_ID", yytext);
        fprintf(fp, "%s - ERRO_TAMANHO_ID\n", yytext);
    }
    else{
        printf("Linha %d: ", nlines);
        printf("\ntipo do token: %d ", ntoken);
        printf("\ntoken: %s\n\n", yytext);
        fprintf(fp, "%s - %s\n", yytext, tokenType(ntoken));
    }

    ntoken = yylex();
  }

 fclose(fp);
  return 0;
}
