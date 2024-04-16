%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
    /*
Sairaj Loke
210001035

implemented the + - * / ops for infix to postfix exp. conversion

*/
%}

%%
[0-9]+  {yylval.sval = strdup(yytext); return VAR;}
[a-zA-Z]+ {yylval.sval = strdup(yytext); return VAR;}
\n      return 0;
.       return *yytext;
%%

int yywrap(){
    return 1;
} 