%{
   /* Definition section */
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;
%}
  
/* Rule Section */
%%
A* { printf("here- %c",yylval, yytext); return 'A'; }
B* { printf(yylval);}
  
. return yytext[0];
  
%%
  
  /*
  
[0-9]+ {
          yylval=atoi(yytext);
          return NUMBER;
  
       }
[\t] ;
  
[\n] return 0;

*/
int yywrap()
{
 return 1;
}