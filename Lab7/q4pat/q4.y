%{
#include <stdio.h>
#include <stdlib.h>

int err = 0;
/*
Sairaj Loke
210001035


as equal a's and b's on both sides

*/
%}



%token A B 
%start pat

%%
pat: x {}; 
x : A x B 
  | /* empty */ ;  

%%

int main() {
    yyparse();
    if(!err){
        printf("\nmatches the required regex (a^n)(b^n), n>= 0 \n");
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    err = 1;
   
}