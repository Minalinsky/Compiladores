%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 15

int nlines=1, ntoken;

struct reserved_word{
	char * word;
	char * return_message;
	int return_value;
};

struct reserved_word reserveds_words[SIZE];

void insert_word(char * word, char * return_message, int return_value){
	int length = strlen(word);
	int asc_value = 0;

	for(int i = 0; i < length; i++)
		asc_value += (int)word[i];

	int position = asc_value % SIZE;

	reserveds_words[position].word = word;
	reserveds_words[position].return_message = return_message;
	reserveds_words[position].return_value = return_value;
}

struct reserved_word find_reserved_words(char *word){
	int length = strlen(word);
	int asc_value = 0;

	for(int i = 0; i < length; i++)
		asc_value += (int)word[i];

	int position = asc_value % SIZE;

	if(strcmp(reserveds_words[position].word, word) == 0)
		return reserveds_words[position];
	
	struct reserved_word nulo;
	nulo.word = "nulo";

	return nulo;
}

void create_hash(){
	insert_word("program", "SIMBOLO_PROGRAM", 3);
	insert_word("begin", "SIMBOLO_BEGIN", 4);
	insert_word("end", "SIMBOLO_END", 5);
	insert_word("const", "SIMBOLO_CONST", 6);
	insert_word("var", "SIMBOLO_VAR", 7);
	insert_word("real", "SIMBOLO_REAL", 8);
	insert_word("integer", "SIMBOLO_INTEGER", 9);
	insert_word("procedure", "SIMBOLO_PROCEDURE", 10);
}
%}

NUMERO_INT [0-9]
NUMERO_REAL {NUMERO_INT}+"."{NUMERO_INT}+
IDENT [a-zA-Z][a-zA-Z0-9_]*
COMENTARIO ["{"][ \ta-zA-Z_]*["}"]
%%

[ \t]     ;
{COMENTARIO}  ;

{NUMERO_INT}+ {printf("<'%d', NUMERO_INT>\n", atoi(yytext)); return 1;}
{NUMERO_REAL} {printf("<'%f', NUMERO_REAL>\n", atof(yytext)); return 2;}


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

{IDENT} {struct reserved_word reserved = find_reserved_words(yytext);
			if(strcmp(reserved.word, "nulo") != 0){
				printf("<%s, %s>\n", yytext, reserved.return_message); 
				return reserved.return_value;}
			printf("<%s, IDENT>\n", yytext); return 35;}

"\n" {nlines++;}

%%
int yywrap(void)
{
	create_hash();
  	return 1;
}


