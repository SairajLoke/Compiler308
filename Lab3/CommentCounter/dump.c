The code file is given as the comment test itself
%{
    #include<stdio.h>
    int count=0;
%}
%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {count++;}
"//"[a-zA-Z0-9\t ]*"\n"   {count++;}
%% 


aint main(int argc ,char* argv[])
{
    yyin=fopen("test2.txt","r");
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

