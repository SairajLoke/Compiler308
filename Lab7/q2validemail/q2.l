%{
#include "y.tab.h"

/*
Note:
Sairaj Loke 
210001035
considering emails such that:

1st start alphanumeric ............................................(must)
second letter could be . _ - or any other alphanumeric char .......(optional)
@..................................................................(must)
post @ , atleast 1 letter..........................................(must)
atleast 1 alphanumeric post . .....................................(must)
2 chars before compulsary . and 

reference - https://docs.blackberry.com/en/id-comm-collab/blackberry-athoc/blackberry-athoc/7_9/create-publish-alerts/email-format-validation/valid-email-address-examples
*/
%}


%%
[a-zA-Z0-9]([._\-]?[a-zA-Z0-9]+)*\@[a-zA-Z0-9]+([._\-]?[a-zA-Z0-9]+)+\.[a-zA-Z0-9]+ {return VALID;}
[\n]                      { return 0; }
.                    //     { return INVALID; }
%%

int yywrap( )
{
	return 0;
}