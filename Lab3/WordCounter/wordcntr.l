%{
   /* Definition section */
  #include<stdio.h>
  extern int yylval;
  int words = 0;
%}
  
/* Rule Section */ 

%%

[a-zA-Z0-9]*[^ a-zA-Z0-9\n]+[a-zA-Z0-9]* {printf("rule 1: %s\n",yytext);}
[a-zA-Z0-9]+  {printf("rule 2:%s\n",yytext);words++;}
%%

int main(int argc ,char* argv[])
{
    yyin=fopen("words.txt","r");
	// yyout=fopen("dump.c","w");
	yylex( );
	printf("The number of words=%d\n",words);
    //mytest file has 3 comments.
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


