%{
    #include<stdio.h>
    int count=0;
%}

%%
[' ']*"/*"[a-zA-Z0-9\n\t ]*"*/"  {count++;}
[' ']*"//"[a-zA-Z0-9\t ]*"\n"   {count++;}
%%

int main(int argc ,char* argv[])
{
    yyin=fopen("comments.txt","r");
	yyout=fopen("dump.c","w");
	yylex( );
	printf("The number of comment lines=%d\n",count);
    //mytest file has 3 comments.
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


