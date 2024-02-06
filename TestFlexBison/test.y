%{

#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *errormsg);

%}

%token HI BYE


%%
program: 
         hi bye
        ;

hi:     
        HI     { printf("Hello World\n");   }
        ;
bye:    
        BYE    { printf("Bye World\n"); exit(0); }
         ;
%%

void main()
{
   yyparse();
   
}

int yyerror(char *errormsg)
{
    fprintf(stderr, "%s\n", errormsg);
    exit(1);
}

