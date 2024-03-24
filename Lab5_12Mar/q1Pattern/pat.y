%{
#include <stdio.h>
// int yylex();
void yyerror(const char *s);
int As = 0;
int Bs = 0;
int flag = 0 ;
/*
Note:  
Refernces: https://developer.ibm.com/tutorials/au-lexyacc/


*/


%}


%token COUNT_A
%token COUNT_B
%token EOL C

%type count_A_list
%type count_B_list

%start Patt

%%

Patt: count_A_list count_B_list ;//KEEPING THE accp lines will print it even after rejected 

count_A_list: COUNT_A count_A_list {As++; printf("%d", As); }
            | /* empty */ {$$ = 0;};

count_B_list: COUNT_B count_B_list {Bs++;printf("%d", Bs);}
            | /* empty */ {$$ = 0;};

%%

void yyerror(const char *s) {
   printf("String Rejected: \n");
   fprintf(stderr, "Error: %s\n", s);
   flag=1;
}

int main() {
   yyparse();
   if(flag==0){
      printf("\nString Accepted: %d A's followed by %d B's\n", As, Bs);
   }
   return 0;
}