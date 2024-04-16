
ops:
	lex q1bin2dec.l
	yacc -d q1bin2dec.y
	cc lex.yy.c y.tab.c -ll
	# ./a.out

clean:
	rm y.tab.c y.tab.h lex.yy.c a.out

