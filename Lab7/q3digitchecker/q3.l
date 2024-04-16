%{
#include "y.tab.h"

/*
Note:
Sairaj Loke 
210001035

allowing empty space (not newline ) before digit
also note the newline necc otherwise 99 gives is a digit and error as well

*/

%}

%%
[' '\t]*[0-9][' '\t]*         { return DIGIT;}
[\n]                      { return NEWLINE;}
.                         { return INVALID; }
%%

int yywrap( )
{
	return 0;
}