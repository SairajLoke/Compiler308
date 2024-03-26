%{
  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;

%}
  

/* Rule Section */
%%

[\t] ;
  
<<EOF>>     return 0;   



"(" {/*printf("%d", yytext[0]);*/printf("1"); return OpParenR;  }
"{" { printf("2"); return OpParenC; }
"[" { printf("3"); return OpParenS; }

")" { printf("4"); return ClsParenR; }
"}" { printf("5"); return ClsParenC; }
"]" { printf("6"); return ClsParenS; }
%%
  
int yywrap()
{
 return 1;
}