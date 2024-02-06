#include<iostream>
#include<vector>
#include<set>
#include <fstream>

using namespace std;



//ref for keywords
// https://en.cppreference.com/w/cpp/keyword
// I have ignored keywords for c++20

//rules for identifier

// shouldnt start with number
// shouldnt be a keyword
//shouldnt start with a symbol
//no spaces 

//ie should contain only _, letter, no.  and not be a keyword, 



// class tokenizer

set<char> std_ops = {'+','-','/', '=', '^'};
set<string> std_keywords = {}; //filled below 
set<char> std_special_symbol = {';','(',')', '{','}',','};  // @ # && || 


set<string> identifier_set = {}; //function name , variables
set<string> keyword_set = {};
set<string> string_set = {}; // inside " dfafa "
set<char> operator_set = {};  // + - / % ^ ! * = %


set<char> special_symbol = {};
set<string> operand_set = {};


bool is_num_or_char_underscore(char x){
    //  _, 0 to 10 , a to z , A to Z  

    return int(x) == 95 || (48 <= int(x) && int(x) <= 57) || (97<=int(x) && int(x) <= 122)  || (65 <=  int(x)  &&  int(x) <= 90 ) ; 
}

bool is_num(char x ){
    return 48 <= int(x) && int(x) <= 57;
}

bool simplecheck(string s){
    if(is_num(s[0])){cout<<"starting with number"<<endl; return 0;}
    for(int i = 0 ; i< s.size() ; ++i){
        // cout<<s[i]<<endl;
        if( ! is_num_or_char_underscore(s[i]) ){ return 0;}
    }
    // cout<<"here"<<endl;
    return 1;
}

int check_identifier_keyword(string inputstr){
    ifstream keywordsfile("keywords.txt");
    string keyline;
    while(std::getline(keywordsfile,keyline)){
        // std::cout<<keyline<<endl;
        std_keywords.insert(keyline);
    }
    keywordsfile.close() ; 
    std::cout<<"\nMy kewords set size: "<<std_keywords.size()<<endl;

    cout<<"\n Checking identifier: "<<inputstr<<endl ; 

    //check no space btw words
    if(inputstr.size() == 0 ){ cout<<"Empty string is not a identifier"<<endl;return 0;}


    if(!simplecheck(inputstr)){cout<<"Invalid format Not a identifier"<<endl;return 0;}  ;   //3 rules of validity
    //check not keyword


    if( std_keywords.find(inputstr) != std_keywords.end() ){ cout<<"Not an Identifier but an keyword" ; keyword_set.insert(inputstr); return 0; }
    cout<<"Yes, it is a valid identifier"<<endl;
    identifier_set.insert(inputstr);

    return 1;

}

bool is_twolenOperator(char x){
    return 0;
}

bool is_operator(char x){
    return ( std_ops.find(x) != std_ops.end()) ;
}

bool is_stdspecialsymbol(char x){
    return ( std_special_symbol.find(x) != std_special_symbol.end()) ;
}

//operators

int main(){

    
    // set<char> special_ops = {} \n \t and others 

    //currently assuming input subroutine is correct
    
    
    ifstream subroutine_file("q3_tokenizer_test.txt");
    string subroutine_line;
    while(std::getline(subroutine_file,subroutine_line)){ //for every line
        std::cout<<"Parsing: "<<subroutine_line<<endl;
        
        //go through the line till it is completely scanned
        for(int i = 0 ; i<subroutine_line.size() ; ++i){
            cout<<subroutine_line[i]<<endl;

            string atom_str = ""; //id keyword, to know

            //skip empty space in start of line
            while(subroutine_line[i] == ' '){++i;}

            //check if curr atom is a string
            if(subroutine_line[i]=='"' ){cout<<"\nstring starts"<<endl;
                ++i; //go to nxt char "word"
                while(subroutine_line[i] != '"'){atom_str += subroutine_line[i]; ++i;}
                string_set.insert(atom_str);
            }

            //skip empty space 
            while(subroutine_line[i] == ' '){++i;}

            //check if special symbol
            // if(is_twolenOperator){}          //cout<<"got operator"<<endl;
            if(is_stdspecialsymbol(subroutine_line[i])){special_symbol.insert(subroutine_line[i]);continue;}

            if(is_operator(subroutine_line[i])){  operator_set.insert(subroutine_line[i]); continue ; }//skip below and start new check
            cout<<"after is_operator"<<endl;
            // if(is_specialsymbol)
            string num_atom = "";
            while(is_num(subroutine_line[i]) ){ num_atom += subroutine_line[i]; ++i;}
            if(num_atom.size() > 0){  operand_set.insert(num_atom);} //cout<<"num_atom"<<endl;
            cout<<"after is_num"<<endl;
        
            //get nxt atom
            string atom = "";    //token separator is empty space or operator or special operator
            while(subroutine_line[i] != ' ' && !is_operator(subroutine_line[i])  ){
                 atom += subroutine_line[i]; ++i;//cout<<"is id atom "<<atom<<endl;
            }
            cout<<"atom: "<<atom<<endl; 
            check_identifier_keyword(atom);
            
            


           
        }



    }
    
    


    subroutine_file.close() ; 

    cout<<"\nIdentifiers: ";
    for (auto i : identifier_set){
        cout<<i<<" ";
    }
    cout<<"\nKeywords: ";
    for (auto i : keyword_set){
        cout<<i<<" ";
    }
    cout<<"\nOperands: ";
    for (auto i : operand_set){
        cout<<i<<" ";
    }
    cout<<"\nOperators: ";
    for (auto i : operator_set){
        cout<<i<<" ";
    }
    cout<<"\nSpecial Operators: ";
    for (auto i : special_symbol){
        cout<<i<<" ";
    }

    return 0;


}

