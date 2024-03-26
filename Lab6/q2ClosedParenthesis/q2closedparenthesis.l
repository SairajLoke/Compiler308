%{
   /*
Sairaj Loke
210001035 Assignment 6 19 March Q2
*/

  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;


  // extern char current_open_parenthesis;

  /*
Method 1: separate brackets

Method 2: regex takes care of closred brackets


[\n] return 0;

  */
%}
  

/* Rule Section */
%%

[\t] ;
  
<<EOF>>     return 0;   //return  means stop parsing



"(" {/*printf("%d", yytext[0]);*/printf("1"); return OpParenR;  }
"{" { printf("2");  return OpParenC; }
"[" { printf("3");  return OpParenS; }

")" { printf("4");  return ClsParenR; }
"}" { printf("5"); return ClsParenC; }
"]" { printf("6");  return ClsParenS; }
. //{yylval = yytext[0] ; return CodeEle;}//[^(){}[]] return CodeEle; return yytext[0] ;//yytext[0]; //check how yytext differs from return an unused token
  
%%
  
int yywrap()
{
 return 1;
}