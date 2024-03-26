%{

  /*
  Sairaj Loke
  210001035  Assignment 5 12 March Q1
  
  */
#include "y.tab.h"
%}

%%
010          { return COUNT_C; }
0             {return COUNT_A; }
1             {return COUNT_B; }
[\n]          { return 0; }
.           { return yytext[0];}

%%

int yywrap() {
    return 1;
}