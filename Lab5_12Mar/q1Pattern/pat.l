%{

  /*
  Sairaj Loke
  210001035  Assignment 5 12 March Q1
  
  */
#include "y.tab.h"
%}

%%
A          {return COUNT_A; }
B          { return COUNT_B; }
[\n]          { return 0; }
.           { return yytext[0];}

%%

int yywrap() {
    return 1;
}