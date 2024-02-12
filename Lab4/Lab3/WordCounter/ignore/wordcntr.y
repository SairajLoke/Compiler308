%{
   /* Definition section */
  #include<stdio.h>
  #include<stdlib.h>
  int flag=0;
  int words = 0 ;
  extern FILE *yyin;
%}
  
%token NUMBER
%token WORD

%start WordExpression
  
/* ------------Rule Section---------- */
%%
  
WordExpression: W{
   printf("\nWord=%d\n", $$);
   return 0;
};
   W: WORD' 'W {$$=$1; ++words; printf("\nright recursive rule"); } |
      WORD {$$=$1;++words; printf("\nterminal rule");}   ;
  
%%
//   -------------------------------------
//driver code

void main()
{
   printf("\nEnter Sentence:\n");

   FILE* fp = fopen("FlexBison/words.txt", "r");
   yyin = fp;
   
   for(int i = 0 ; i< 4 ++i){
      yyparse();
   }
  
   if(flag==0)
      printf("\nEntered arithmetic expression is Valid\n\n");
      printf("%d words", words);
}
  
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}
