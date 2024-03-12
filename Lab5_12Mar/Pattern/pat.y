%{
   /* Definition section */
  #include<stdio.h>
  int flag=0;
//   #include<unordered_set>
//   unordered_set<char> operator_set;
  int total_operands = 0;
  int total_operators= 0;

%}
  
%token A B
%start P
  
  
/* Rule Section */
%%
  

P: P{
  
         printf("\nResult=%d\n", $$);
  
         return 0;
  
        };
 P: P'A'  {$$=printf("%d",$$);} //operator_set.insert('+');}
   | 'A'
  
%%
  
//driver code
void main()
{
   printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication, Division, Modulus and Round brackets:\n");
  
   yyparse();
   if(flag==0){
    printf("\nEntered arithmetic expression is Valid\n\n");
    printf("Total Operators: %d \n",total_operators);
    printf("Total Operands: %d \n", total_operands);


//    for(auto& op : operator_set){
//     cout<<op<<" ";
//    }
   }
}


  
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}