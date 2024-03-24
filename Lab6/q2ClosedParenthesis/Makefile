
ops:
	lex q2closedparenthesis.l
	yacc -d q2closedparenthesis.y
	cc lex.yy.c y.tab.c -ll
	# ./a.out

clean:
	rm y.tab.c y.tab.h lex.yy.c a.out


