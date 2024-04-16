%{
/*
Sairaj Loke
210001035 Assignment 7 2April Q1


Bin2Dec (assume no signed bit)
1. normal type (eg. 010) of unlim size
2. neg num?

note: u can ignore the cpp tests , mytests, gtests.
i was just experimenting with the gtests module

*/

  #include<stdio.h>
  int flag=0;
  extern int yytext;
  extern FILE *yyin;
  extern FILE *yyout;
  int num = 0;
  int idx = 0;
//   char* inputstr
%}

%token ONE ZERO INVALID
%token BinDigit
%start BinNo

    
/* Rule Section */
%%
  //here precedence to right side, so {} runs only after BinNo is empty(last bin) 
  //that bit depending on whether it is 0/1 is run in diff prod rules as we backtrack in the parse tree
BinNo: ONE BinNo {num = num + (1<<idx); printf("%d ", (1<<idx)); idx++ ; }//printf("here");}  
 |  ZERO BinNo {idx++; } 
 | /*empty*/ ; //for the last one
  
%%


  
void yyerror()
{
   printf("\n Invalid Binary Representation \n");
   // printf("\t%d--\n", yylval);
   flag=1;
}


int main(int argc, char *argv[])
{
   //  char string[] = argv[1] + "\0";
   //  YY_BUFFER_STATE buf = yy_scan_buffer(string, sizeof(string));
//    yyin=fopen("q1input.txt","r");
//    yyin = argv[1];

    // buf = yy_scan_string(argv[1]);
    
   
   yyparse();
   if(flag==0){
    printf("\nInput: %s in Decimal: %d ","binnum", num);

   }

   printf("\nclosing resources\n");

   // yy_delete_buffer(buf);
//    fclose(yyin);


   return num;
}

