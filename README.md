# Compiladores


Compilando:

flex regex.l

gcc -g main.c lex.yy.c -lfl -o nome_arquivo_saida

./nome_arquivo_saida < input.txt
