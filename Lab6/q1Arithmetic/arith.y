%{
/*
Sairaj Loke
210001035 Assignment 6 19 March Q1 

I was trying to maintain a set of chars but need to check compiling yacc in c++ for that 
so you can see the unordered set mentions in the code...haven't removed it yet as i'll get back to it some other day
*/

// if we write %right then we ignore (

  #include<stdio.h>
  int flag=0;
//   #include<unordered_set>
//   unordered_set<char> operator_set;  
  int total_operands = 0;
  int total_operators= 0;

%}
  
%token NUMBER
%start ArithmeticExpression 
  
%left '+' '-'

%left '*' '/' '%'
  
%left '(' ')'  
  
/* Rule Section */
%%
  
ArithmeticExpression: E{
  
         printf("\nResult=%d\n", $$);//the expr could be invalid at this point
  
        };
 E:E'+'E {$$=$1+$3; total_operators++ ;} //operator_set.insert('+');}
  
 |E'-'E {$$=$1-$3; total_operators++ ;} //operator_set.insert('-');}
  
 |E'*'E {$$=$1*$3; total_operators++ ;} //operator_set.insert('*');}
  
 |E'/'E {$$=$1/$3; total_operators++ ;} //operator_set.insert('/');}
  
 |E'%'E {$$=$1%$3; total_operators++ ;} //operator_set.insert('%');}
  
 |'('E')' {$$=$2; total_operators++ ;} //operator_set.insert('('); operator_set.insert(')');}
  
 | NUMBER {$$=$1; total_operands++; }
  
 ;
  
%%


  
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}


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

