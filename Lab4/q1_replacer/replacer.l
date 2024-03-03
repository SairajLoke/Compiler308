%{
    #include<stdio.h>
	#include<stdlib.h>
    int count= 2; //get from random generator
	extern int yylval;

%}

%%
[a-z] {fprintf(yyout, "%c", ((char)(yytext[0]-'a'+count) % 26 ) + 'a' ) ; printf("encountered %d returned %d\n",(int)yytext[0],(int)yytext[0]+count) ; count = (count+1)%26 ;} 
[A-Z] {fprintf(yyout, "%c", ((char)(yytext[0]-'A'+count) % 26 ) + 'A' ) ; printf("encountered %d returned %d\n",(int)yytext[0],(int)yytext[0]+count) ; count = (count+1)%26 ;} 

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


