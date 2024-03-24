%{
/*
Sairaj Loke
210001035 Assignment 6 19 March Q3

1 interesting observation is that the tokens

*/

  #include<stdio.h>
  int flag=0;
  extern int yytext;
  extern FILE *yyin;
  extern FILE *yyout;



%}

%token HelpingVerb NotHelpingVerb
%start Sentence

    
/* Rule Section */
%%
  
Sentence: Sentence HelpingVerb {printf(" y\n");} 
 //seg fault while accessing yytext/yylval from here ,
//  so i have printed the token value in the scanner itself
 
 |  Sentence NotHelpingVerb {printf(" n\n");} 

 | /*empty*/ ; //for the last one
  
%%


  
void yyerror()
{
   printf("\n Invalid Parenthesis structure \n");
   printf("\n Unbalanced Parenthesis : %c\n", '0');
   // printf("\t%d--\n", yylval);
   flag=1;
}


void main()
{
   yyin=fopen("q3input.txt","r");

   //remove comments
   // printf("Preprocessing ie. removing comments to avoid invalid parenthesis decisions");

   
   //check closed bracket
   // printf("\nChecking Closed Parenthesis");
   
   yyparse();
   if(flag==0){
    printf("\nFound the helpful verbs.");

   }

   printf("\nclosing resources\n");
   fclose(yyin);
}

