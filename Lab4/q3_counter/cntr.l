%{
    #include<stdio.h>
    int cnt_pi = 0 ;
	int cnt_ni = 0 ;
    int cnt_pf = 0 ;
    int cnt_nf = 0 ;
%}

%%
neg_num  [-][0-9]* 

neg_num {++cnt_ni;}
\+?[0-9]* {++cnt_pi;}  //keeping explicit + optional
\+?[0-9]*[/|.][0-9]* {++cnt_pf;}
[-][0-9]*[/|.][0-9]* {++cnt_nf;}
%%

int main(int argc ,char* argv[])
{
    yyin=fopen("comments.txt","r");
	yyout=fopen("dump.c","w");
	yylex( );
	printf("The number of \n+ve ints : %d, \n-ve ints: %d,  \n+ve fractions: %d,  \n-ve fractions: %d \n",cnt_pi, cnt_ni, cnt_pf, cnt_nf);
	fclose(yyin);
	fclose(yyout);
}

int yywrap( )
{
	return 1;
}


