
pat:
	lex pat.l
	yacc -d pat.y
	cc lex.yy.c y.tab.c -ll
	# ./a.out

clean:
	rm y.tab.c y.tab.h lex.yy.c a.out