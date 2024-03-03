%{
    #include<stdio.h>
    int cnt_scanf = 0 ;
	int cnt_printf = 0 ;
%}

%%
"printf" {cnt_printf++;}
"scanf" {cnt_scanf++;}
"printf("[.*]")" {cnt_printf++;}
"scanf("[.*]")"  {cnt_scanf++;}
[a-zA-Z0-9]* {;} //ie it is neighter of above 
%%

int main(int argc ,char* argv[])
{
    yyin=fopen("comments.txt","r");
	yyout=fopen("dump.c","w");
	yylex( );
	printf("The number of printf: %d, scanf: %d \n",cnt_printf,cnt_scanf);
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


