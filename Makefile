all:
	flex regex.l
	gcc -g main.c lex.yy.c -lfl -o lexical

run:
	./lexical < input.txt
