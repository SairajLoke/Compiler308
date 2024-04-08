%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool validated = false;
%}



%token DIGIT NEWLINE INVALID

%%
start: DIGIT NEWLINE {printf("is a digit\n"); exit(0);}; 
%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}