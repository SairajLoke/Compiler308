%{

#include "y.tab.h"


%}

%%

("hi"|"oi")"\n"       { return HI;  }
("tchau"|"bye")"\n"   { return BYE; }
.                     { yyerror("Unknown char");  }

%%


int yywrap(void)
{
   return 0;
}



