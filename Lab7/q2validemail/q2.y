%{
#include <stdio.h>
#include <stdlib.h>
%}

%token VALID 

%%
start : VALID {printf("valid email\n");};

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid email, error: %s\n", s);
}