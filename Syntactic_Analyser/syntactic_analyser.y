%{
void yyerror (char *s); //eliminando warning
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yylineno();
extern void create_hash();
extern char* yytext;
extern int nlines;
%}

/*
%token DIGITO NUMERO_INT NUMERO_REAL IDENT COMENTARIO NUMERO_INT NUMERO_REAL ATRIBUICAO IGUAL PONTO_VIRGULA SIMBOLO_VIRGULA DOIS_PONTOS 
MULT DIV SOMA SUB SIMBOLO_APAR SIMBOLO_FPAR DIFERENTE MAIOR_IGUAL MENOR_IGUAL MAIOR MENOR PONTO SIMBOLO_PROGRAM SIMBOLO_BEGIN SIMBOLO_END 
SIMBOLO_CONST SIMBOLO_VAR SIMBOLO_REAL SIMBOLO_INTEGER SIMBOLO_PROCEDURE SIMBOLO_ELSE SIMBOLO_READ SIMBOLO_WRITE SIMBOLO_WHILE SIMBOLO_IF 
SIMBOLO_THEN SIMBOLO_DO SIMBOLO_FOR SIMBOLO_TO
*/

%token DIGITO NUMERO_INT NUMERO_REAL IDENT COMENTARIO SIMBOLO_PROGRAM SIMBOLO_BEGIN SIMBOLO_END 
SIMBOLO_CONST SIMBOLO_VAR SIMBOLO_REAL SIMBOLO_INTEGER SIMBOLO_PROCEDURE SIMBOLO_ELSE SIMBOLO_READ SIMBOLO_WRITE SIMBOLO_WHILE SIMBOLO_IF 
SIMBOLO_THEN SIMBOLO_DO SIMBOLO_FOR SIMBOLO_TO

%left ':' '=' ';' ',' '*' '/' '+' '-' '(' ')' '<' '>' '.'

// Aqui o identificador de começo
%start programa

%%

programa: SIMBOLO_PROGRAM IDENT ';' corpo 
    ;
corpo: dc SIMBOLO_BEGIN comandos SIMBOLO_END
    ;
dc: dc_c dc_v dc_p
    ;
dc_c: SIMBOLO_CONST IDENT '=' numero ';' dc_c
    | 
    ;
dc_v: SIMBOLO_VAR variaveis ':' tipo_var ';' dc_v
    |
    ;
tipo_var: NUMERO_REAL
    | NUMERO_INT
    ;
variaveis: IDENT mais_var
    ;
mais_var: ',' variaveis
    |
    ;
dc_p: SIMBOLO_PROCEDURE IDENT parametros ';'corpo_p dc_p
    |
    ;
parametros: '(' lista_par ')'
    |
    ;
lista_par: variaveis ':' tipo_var mais_par
    ;
mais_par: ';' lista_par
    |
    ;
corpo_p: dc_loc SIMBOLO_BEGIN comandos SIMBOLO_END ';'
    ;
dc_loc: dc_v
    ;
lista_arg: '(' argumentos ')'
    |
    ;
argumentos: IDENT mais_ident
    ;
mais_ident: ';' argumentos
    |
    ;
pfalsa: SIMBOLO_ELSE cmd
    |
    ;
comandos: cmd ';' comandos
    |
    ;
cmd: SIMBOLO_READ '(' variaveis ')'
    | SIMBOLO_WRITE '(' variaveis ')'
    | SIMBOLO_WHILE '(' condicao ')' SIMBOLO_DO cmd
    | SIMBOLO_IF condicao SIMBOLO_THEN cmd pfalsa
    | IDENT ':' '=' expressao
    | IDENT lista_arg
    | SIMBOLO_BEGIN comandos SIMBOLO_END
    ;
condicao: expressao relacao expressao
    ;
relacao: '='
    | '<''>'
    | '>''='
    | '<''='
    | '>'
    | '<'
    ;
expressao: termo outros_termos
    ;
op_un: '+'
    | '-'
    |
    ;
outros_termos: op_ad termo outros_termos
    |
    ;
op_ad: '+'
    | '-'
    ;
termo: op_un fator mais_fatores
    ;
mais_fatores: op_mul fator mais_fatores
    |
    ;
op_mul: '*'
    | '/'
    ;
fator: IDENT
    | numero
    | '(' expressao ')'
    ;
numero: NUMERO_INT
    | NUMERO_REAL
    ;

%%

// Função que deveria imprimir a mesagem de erro
// Chamando essa função em syntactic.analyser.l, mas ainda não sei se da forma correta
void yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}


int main(int argc, char const *argv[]) {
    create_hash();
  int ntoken, vtoken;
//   FILE *fp = fopen("tokens.txt", "w+");

//   ntoken = yylex();
//   // Função principal, futuramente substituida pelo analisador sintático
//   while(ntoken){
//     // Tratar os erros aqui!
//     //tratando tamanho dos identificadores
//     if((ntoken == 37) && (strlen(yytext) > 32)){
//         printf("Tamanho do identificador incompativel: %s\n", yytext);
//         fprintf(fp, "%s - ERRO_TAMANHO_ID\n", yytext);
//     }
//     else if(ntoken == -1){
//         printf("%s - ERRO\n", yytext);
//         fprintf(fp, "%s - ERRO\n", yytext);
//     }
//     else{
//         // printf("Linha %d: ", nlines);
//         // printf("\ntipo do token: %d ", ntoken);
//         // printf("\ntoken: %s\n", yytext);
//         // fprintf(fp, "%s - %s\n", yytext, tokenType(ntoken));
//     }

//     ntoken = yylex();
//   }

//   fclose(fp);
  
  return yyparse(); //Inicializando o analisador sintático

}
