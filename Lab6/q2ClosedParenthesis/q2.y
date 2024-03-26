%{
/*
*/

  #include<stdio.h>
  int flag=0;
  int total_Rbracket_pairs= 0;
  int total_Cbracket_pairs= 0;
  int total_Sbracket_pairs= 0;
  extern int yytext;
  extern FILE *yyin;
  extern FILE *yyout;


%}

%token OpParenR ClsParenR
%token OpParenC ClsParenC
%token OpParenS ClsParenS
%token CodeEle
%start CCode

    
/* Rule Section */
%%
  
CCode: CodeChunk{}//printf("parsed");};
 CodeChunk:OpParenR CodeChunk ClsParenR CodeChunk{total_Rbracket_pairs++ ; printf("r");} 
 
 | OpParenC CodeChunk ClsParenC CodeChunk{total_Cbracket_pairs++ ; printf("c");} 
 
 | OpParenS CodeChunk ClsParenS CodeChunk{total_Sbracket_pairs++ ; printf("s");} 

 | CodeEle {printf("Code Ele: \t%d--\n", yylval);}

 | /*empty*/ ;
  
%%


  
void yyerror()
{
   printf("\n Invalid Parenthesis structure \n");
   flag=1;
}


void main()
{
   yyin=fopen("q2input.c","r");
	yyout=fopen("q2output.txt","w");


   yyparse();
   if(flag==0){
    printf("\nEntered Ccode has Balanced Parenthesis\n");
    printf("\nTotal ( pairs: %d", total_Rbracket_pairs);
    printf("\nTotal {} pairs: %d", total_Cbracket_pairs);
    printf("\nTotal [] pairs: %d\n", total_Sbracket_pairs);

   }
   fclose(yyin);
   fclose(yyout);
}

