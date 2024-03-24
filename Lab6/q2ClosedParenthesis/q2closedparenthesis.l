%{
   /*
Sairaj Loke
210001035 Assignment 6 19 March Q2
*/

  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;
  extern char current_open_parenthesis;

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



"(" {/*printf("%d", yytext[0]);*/current_open_parenthesis = '('; return OpParenR;  }
"{" {current_open_parenthesis = '{'; return OpParenC; }
"[" {current_open_parenthesis = '['; return OpParenS; }

")" {return ClsParenR; }
"}" {return ClsParenC; }
"]" {return ClsParenS; }
. //{yylval = yytext[0] ; return CodeEle;}//[^(){}[]] return CodeEle; return yytext[0] ;//yytext[0]; //check how yytext differs from return an unused token
  
%%
  
int yywrap()
{
 return 1;
}