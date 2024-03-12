
ops:
	lex arith.l
	yacc -d arith.y
	cc lex.yy.c y.tab.c -ll
	# ./a.out

clean:
	rm y.tab.c y.tab.h lex.yy.c a.out