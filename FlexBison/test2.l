%{
   /* Definition section */
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;
%}
  
/* Rule Section */ 

%%

[a-zA-z0-9]+ { yylval = yytext; printf("\ninput - %s", yytext) ; return WORD; }

[\t] ;
  
[\n] return 0;
  
. return yytext[0];
  
%%
  
int yywrap()  //to return 1, when end of input occurs
{
 return 1;
}
