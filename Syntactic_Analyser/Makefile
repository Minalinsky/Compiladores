all:
	yacc -dv syntactic_analyser.y
	lex syntactic_analyser.l
	cc -o teste lex.yy.c y.tab.c -ly