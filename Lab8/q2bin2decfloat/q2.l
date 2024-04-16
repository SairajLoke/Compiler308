%{
   /*
Sairaj Loke
210001035 Assignment 7 2April Q1 
*/

  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;


%}
  
/* Rule Section */
%%

[0]  /*{ printf(yytext);*/ {return ZERO;}
[1]  /*{ printf(yytext);*/ {return ONE;}
[.]    {return DECIMAL ; }  
[\n] return 0; // {return INVALID;}//ignore everything else, but if any other num (other than 0/1 ) 

%%
  
int yywrap()
{
 return 1;
}