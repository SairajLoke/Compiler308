%{
   /* Definition section */
  #include<stdio.h>
  extern int yylval;
  int words = 0;
%}
  
/* Rule Section */ 

%%
[a-z] {fprintf(yyout, "%c", (char)(yytext[0]-'a'+'A')  );} 
[A-Z] {fprintf(yyout, "%c", (char)(yytext[0]-'A'+ 'a') );} 
%%

int main(int argc ,char* argv[])
{
    // [a-zA-Z0-9]*[^ a-zA-Z0-9\n]+[a-zA-Z0-9]* {printf("rule 1: %s\n",yytext);}
    yyin=fopen("words.txt","r");
	yyout=fopen("dump.c","w");
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


