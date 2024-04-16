%{
#include<stdio.h>

    /*
Sairaj Loke
210001035

implemented the + - * / ops for infix to postfix exp. conversion
like a postorder travelsal
note 
for left associative , then first one stk be poped for >= (than curr oprtr)....after continously popping push curr 
for right asso , stk be poped for > (than curr oprtr)  (for = , right one ie the curr be given more impt)......after continously popping push curr 
eg.
*/

%}
%union {
    char *sval; 
}
%token <sval> VAR
%left '+' '-'
%left '*' '/'
%right '^'
%right NEGATIVE
%%

S:  E  ;
E:      E '+' E {printf("+");}
    |   E '*' E {printf("*");}
    |   E '-' E {printf("-");}
    |   E '/' E {printf("/");}
    |   E '^' E {printf("^");}
    |   '(' E ')'
    |   '-' E %prec NEGATIVE {printf("- ");} 
        // a minus sign typically has a very high precedence as a unary operator, 
        //and a somewhat lower precedence (lower than multiplication) as a binary operator.
        // thus the precedence can be contextually controlled using this yacc keyword %prec
        // here - is associated with the prec  is given that of Neg sign and not  one with + 

    |   VAR     {printf(" %s", yylval.sval);}
    ;
%%

int yyerror (char *msg) {
    return printf ("yyerror: %s\n", msg);
}


int main(){
    printf("Prinft the infix expression: \t");
    yyparse();
    printf("\n");
}
