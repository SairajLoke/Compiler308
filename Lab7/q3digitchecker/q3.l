%{
#include "y.tab.h"

/*
Note:
Sairaj Loke 
210001035

allowing empty space (not newline ) before digit

*/

%}

%%
[' '\t]*[0-9][' '\t]*         { return DIGIT;}
[\n]                      { return NEWLINE; }
.                         { return INVALID; }
%%

int yywrap( )
{
	return 0;
}