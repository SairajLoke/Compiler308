%{
/*
Sairaj Loke
210001035 Assignment 6 19 March Q2

I was trying to maintain a set of chars but need to check compiling yacc in c++ for that 
so you can see the unordered set mentions in the code...haven't removed it yet as i'll get back to it some other day
*/

  #include<stdio.h>
  int flag=0;
  int total_Rbracket_pairs= 0;
  int total_Cbracket_pairs= 0;
  int total_Sbracket_pairs= 0;
  extern int yytext;
  extern FILE *yyin;
  extern FILE *yyout;
  extern char current_open_parenthesis = '-';

/*
    CodeChunk: '('CodeChunk')' {total_Rbracket_pairs++ ; printf("r");} 

 | CodeChunk: '{'CodeChunk'}' {total_Cbracket_pairs++ ;printf("c");} 

 | CodeChunk: '['CodeChunk']' {total_Sbracket_pairs++ ;printf("s");} 

*/

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
   printf("\n Unbalanced Parenthesis : %c\n", current_open_parenthesis);
   // printf("\t%d--\n", yylval);
   flag=1;
}


void main()
{
   yyin=fopen("q1input.c","r");
	yyout=fopen("q1output.txt","w");

   //remove comments
   // printf("Preprocessing ie. removing comments to avoid invalid parenthesis decisions");

   
   //check closed bracket
   // printf("\nChecking Closed Parenthesis");
   
   yyparse();
   if(flag==0){
    printf("\nEntered Ccode has Balanced Parenthesis\n");
    printf("\nTotal () pairs: %d", total_Rbracket_pairs);
    printf("\nTotal {} pairs: %d", total_Cbracket_pairs);
    printf("\nTotal [] pairs: %d\n", total_Sbracket_pairs);

   }

   printf("closing resources\n");
   fclose(yyin);
   fclose(yyout);
}

