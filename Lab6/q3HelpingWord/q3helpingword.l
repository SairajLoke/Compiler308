%{
   /*
Sairaj Loke
210001035 Assignment 6 19 March Q3 
*/

  #include<stdio.h>
  #include "y.tab.h"
  extern int yylval;


%}
  
/* Rule Section */
%%

"am"  { printf(yytext); return HelpingVerb;}
"is"  { printf(yytext); return HelpingVerb;}
"are" {printf(yytext);return HelpingVerb;}
"was" {printf(yytext);return HelpingVerb;}
"were" {printf(yytext);return HelpingVerb;}
"being" {printf(yytext);return HelpingVerb;}
"been" {printf(yytext);return HelpingVerb;}
"be" {printf(yytext);return HelpingVerb;}
"have" {printf(yytext);return HelpingVerb;}
"has" {printf(yytext);return HelpingVerb;}
"had" {printf(yytext);return HelpingVerb;}
"do" {printf(yytext);return HelpingVerb;}
"does" {printf(yytext);return HelpingVerb;}
"did" {printf(yytext);return HelpingVerb;}
"will" {printf(yytext);return HelpingVerb;}
"would" {printf(yytext);return HelpingVerb;}
"shall" {printf(yytext);return HelpingVerb;}
"should" {printf(yytext);return HelpingVerb;}
"may" {printf(yytext);return HelpingVerb;}
"might" {printf(yytext);return HelpingVerb;}
"must" {printf(yytext);return HelpingVerb;}
"can" {printf(yytext);return HelpingVerb;}
"could" {printf(yytext);return HelpingVerb;}

  
[\n] return 0;
[a-zA-Z]* {printf(yytext);  return NotHelpingVerb;}/*ignore*/;
. ; //ignore everything else

%%
  
int yywrap()
{
 return 1;
}