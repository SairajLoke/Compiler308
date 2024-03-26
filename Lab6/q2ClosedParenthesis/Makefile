
ops:
	echo "This command runs my cpp preprocessor to remove comments and then the parenthesis code"
	echo ""
	g++ comment_preprocessor.cpp -o comment_preprocessor
	./comment_preprocessor

	lex q2closedparenthesis.l
	yacc -d q2closedparenthesis.y
	cc lex.yy.c y.tab.c -ll
	./a.out

clean:
	rm y.tab.c y.tab.h lex.yy.c a.out

ignr:

	lex q2.l
	yacc -d q2.y
	cc lex.yy.c y.tab.c -ll
	./a.out
