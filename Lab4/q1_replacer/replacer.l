%{
    #include<stdio.h>
	#include<stdlib.h>
    int count= 2; //get from random generator
	extern int yylval;

%}

%%
[a-zA-Z] {fprintf(yyout, "%c", (char)(yytext[0]+count) ) ; count += 1 ;} 
%%

int main(int argc ,char* argv[])
{
    yyin=fopen("comments.txt","r");
	yyout=fopen("shifted.txt","w");
	yylex( );
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


