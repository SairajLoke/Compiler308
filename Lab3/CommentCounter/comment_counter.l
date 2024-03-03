%{
    #include<stdio.h>
    int count=0;
%}

%%
[' ']*"/*".*"*/"  {count++;} /*{***/ //using Kleene closur
[' ']*"//".*   {count++;}//cout<<"here"<<a<} 
%%

int main(int argc ,char* argv[])
{	
	//how to find no. lines of comments

    yyin=fopen("comments.txt","r");
	yyout=fopen("dump.c","w");
	yylex();
	printf("The number of comment lines=%d\n",count);
    //mytest file has 3 comments.
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


