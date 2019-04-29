%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 25
#define RESERVERD_WORDS 17

int nlines=1, ntoken;

struct reserved_word{
	char * word;
	char * return_message;
	int return_value;
};

struct reserved_word reserveds_words[SIZE];

void insert_word_aux(char * word, char * return_message, int return_value){
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
	if(length <= 9){
		int asc_value = 0;

		for(int i = 0; i < length; i++)
			asc_value += (int)word[i];

		int position = asc_value % SIZE;

		if(strcmp(reserveds_words[position].word, word) == 0)
			return reserveds_words[position];
	}

	struct reserved_word nulo;
	nulo.word = "nulo";

	return nulo;
}

void insert_word(int i){
	char * word;
	char * return_message;

	if(i == 0){
		word = (char*)malloc(sizeof(char) * 7);
		word = "program";
		return_message = (char*)malloc(sizeof(char) * 15);
		return_message = "SIMBOLO_PROGRAM";
	}
	else if(i == 1){
		word = (char*)malloc(sizeof(char) * 5);
		word = "begin";
		return_message = (char*)malloc(sizeof(char) * 13);
		return_message = "SIMBOLO_BEGIN";
	}
	else if(i == 2){
		word = (char*)malloc(sizeof(char) * 3);
		word = "end";
		return_message = (char*)malloc(sizeof(char) * 11);
		return_message = "SIMBOLO_END";
	}
	else if(i == 3){
		word = (char*)malloc(sizeof(char) * 5);
		word = "const";
		return_message = (char*)malloc(sizeof(char) * 13);
		return_message = "SIMBOLO_CONST";
	}
	else if(i == 4){
		word = (char*)malloc(sizeof(char) * 3);
		word = "var";
		return_message = (char*)malloc(sizeof(char) * 11);
		return_message = "SIMBOLO_VAR";
	}
	else if(i == 5){
		word = (char*)malloc(sizeof(char) * 4);
		word = "real";
		return_message = (char*)malloc(sizeof(char) * 12);
		return_message = "SIMBOLO_REAL";
	}
	else if(i == 6){
		word = (char*)malloc(sizeof(char) * 7);
		word = "integer";
		return_message = (char*)malloc(sizeof(char) * 15);
		return_message = "SIMBOLO_INTEGER";
	}
	else if(i == 7){
		word = (char*)malloc(sizeof(char) * 9);
		word = "procedure";
		return_message = (char*)malloc(sizeof(char) * 17);
		return_message = "SIMBOLO_PROCEDURE";
	}
	else if(i == 8){
		word = (char*)malloc(sizeof(char) * 4);
		word = "else";
		return_message = (char*)malloc(sizeof(char) * 12);
		return_message = "SIMBOLO_ELSE";
	}
	else if(i == 9){
		word = (char*)malloc(sizeof(char) * 4);
		word = "read";
		return_message = (char*)malloc(sizeof(char) * 12);
		return_message = "SIMBOLO_READ";
	}
	else if(i == 10){
		word = (char*)malloc(sizeof(char) * 5);
		word = "write";
		return_message = (char*)malloc(sizeof(char) * 13);
		return_message = "SIMBOLO_WRITE";
	}
	else if(i == 11){
		word = (char*)malloc(sizeof(char) * 5);
		word = "while";
		return_message = (char*)malloc(sizeof(char) * 13);
		return_message = "SIMBOLO_WHILE";
	}
	else if(i == 12){
		word = (char*)malloc(sizeof(char) * 2);
		word = "if";
		return_message = (char*)malloc(sizeof(char) * 10);
		return_message = "SIMBOLO_IF";
	}
	else if(i == 13){
		word = (char*)malloc(sizeof(char) * 4);
		word = "then";
		return_message = (char*)malloc(sizeof(char) * 12);
		return_message = "SIMBOLO_THEN";
	}
	else if(i == 14){
		word = (char*)malloc(sizeof(char) * 2);
		word = "do";
		return_message = (char*)malloc(sizeof(char) * 10);
		return_message = "SIMBOLO_DO";
	}
	else if(i == 15){
		word = (char*)malloc(sizeof(char) * 3);
		word = "for";
		return_message = (char*)malloc(sizeof(char) * 11);
		return_message = "SIMBOLO_FOR";
	}
	else if(i == 16){
		word = (char*)malloc(sizeof(char) * 3);
		word = "to";
		return_message = (char*)malloc(sizeof(char) * 11);
		return_message = "SIMBOLO_TO";
	}

	insert_word_aux(word, return_message, (i + 3));
}

void create_hash(){
	for(int i = 0; i < RESERVERD_WORDS; i++)
		insert_word(i);
}

%}

DIGITO [0-9]
NUMERO_INT -?{DIGITO}({DIGITO})*
NUMERO_REAL -?{DIGITO}+"."{DIGITO}+
IDENT [a-zA-Z][a-zA-Z0-9_]*
COMENTARIO ["{"][ \ta-zA-Z_]*["}"]
%%

[ \t]     ;
{COMENTARIO}  ;


{NUMERO_INT}+ {printf("<'%d', NUMERO_INT>\n", atoi(yytext)); return 1;}
{NUMERO_REAL} {printf("<'%f', NUMERO_REAL>\n", atof(yytext)); return 2;}

{NUMERO_INT}[_@#$%&a-zA-Z]+{DIGITO}*  {printf("Numero mal formatado: %s\n", yytext); return -1;}
{NUMERO_INT}"."{DIGITO}*[_@#$%&a-zA-Z]+{DIGITO}* {printf("Numero mal formatado: %s\n", yytext); return -1;}

[_@#$%&]+[a-zA-Z0-9]* {printf("Identificador mal formatado: %s\n", yytext); return -1;}
["{"][ \ta-zA-Z_]* {printf("Comentário não fechado: %s\n", yytext); return -1;}

":=" {printf("<%s, ATRIBUICAO>\n", yytext); return 19;}
"=" {printf("<%s, IGUAL>\n", yytext); return 20;}
";" {printf("<%s, PONTO_VIRGULA>\n", yytext); return 21;}
"," {printf("<%s, SIMBOLO_VIRGULA>\n", yytext); return 22;}
":" {printf("<%s, DOIS_PONTOS>\n", yytext); return 23;}
"*" {printf("<%s, MULT>\n", yytext); return 24;}
"/" {printf("<%s, DIV>\n", yytext); return 25;}
"+" {printf("<%s, SOMA>\n", yytext); return 26;}
"-" {printf("<%s, SUB>\n", yytext); return 27;}
"(" {printf("<%s, SIMBOLO_APAR>\n", yytext); return 28;}
")" {printf("<%s, SIMBOLO_FPAR>\n", yytext); return 29;}
"<>" {printf("<%s, DIFERENTE>\n", yytext); return 30;}
">=" {printf("<%s, MAIOR_IGUAL>\n", yytext); return 31;}
"<=" {printf("<%s, MENOR_IGUAL>\n", yytext); return 32;}
">" {printf("<%s, MAIOR>\n", yytext); return 33;}
"<" {printf("<%s, MENOR>\n", yytext); return 34;}
"." {printf("<%s, PONTO>\n", yytext); return 35;}

{IDENT} {struct reserved_word reserved = find_reserved_words(yytext);
			if(strcmp(reserved.word, "nulo") != 0){
				printf("<%s, %s>\n", yytext, reserved.return_message);
				return reserved.return_value;
			}
			printf("<%s, IDENT>\n", yytext); return 36;
		}

"\n" {nlines++;}

. {printf("entrada invalida: %s\n", yytext); return -1;}
%%

int yywrap(void)
{
  	return 1;
}
