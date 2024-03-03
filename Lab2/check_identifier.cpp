#include<iostream>
#include<vector>
#include<set>
#include <fstream>

using namespace std;

//ref for keywords
// https://en.cppreference.com/w/cpp/keyword
// I have ignored keywords for c++20, as i currently use c++11

//rules for identifier

// shouldnt start with number
// shouldnt be a keyword
//shouldnt start with a symbol
//no spaces 

//ie should contain only _, letter, no.  and not be a keyword, 

bool is_num_or_char_underscore(char x){
    //  _, 0 to 10 , a to z , A to Z  

    return int(x) == 95 || (48 <= int(x) && int(x) <= 57) || (97<=int(x) && int(x) <= 122)  || (65 <=  int(x)  &&  int(x) <= 90 ) ; 
}

bool is_num(char x ){
    return 48 <= int(x) && int(x) <= 57;
}

bool simplecheck(string s){
    bool start = true;
    if(is_num(s[0])){cout<<"starting with number"<<endl; return 0;}
    for(int i = 0 ; i< s.size() ; ++i){
        if (s[i]==' ' && !start){cout<<"not identifier has gaps"<<endl;return 0;}

        while(i < s.size() && s[i] == ' ') {i++;}
        start = false;
        
        // cout<<s[i]<<endl;
        if( ! is_num_or_char_underscore(s[i]) ){ return 0;}
    }
    // cout<<"here"<<endl;
    return 1;
}

int check_identifier(string inputstr){
    set<string> keywords_set ; //no find in unordered set
    ifstream keywordsfile("keywords.txt");
    string keyline;

    
    while(std::getline(keywordsfile,keyline)){
        // std::cout<<keyline<<endl;
        keywords_set.insert(keyline);
    }
    keywordsfile.close() ; 
    std::cout<<"\nMy kewords set size: "<<keywords_set.size()<<endl;

    // cout<<"\nInput the identifier to check"<<endl ; 
    // string inputstr ;

    // getline(cin, inputstr);
    //check no space btw words
    cout<<"received "<<inputstr<<endl;
    if(inputstr.size() == 0 ){ cout<<"Empty string is not a identifier"<<endl;return 0;}

    
    if(!simplecheck(inputstr)){cout<<"Invalid format Not a identifier"<<endl;return 0;}  ;   //3 rules of validity
    //check not keyword


    if( keywords_set.find(inputstr) != keywords_set.end() ){ cout<<"Not an Identifier but an keyword" ; return 0; }
    cout<<"Yes, it is a valid identifier"<<endl;

    return 1;
}
// int main(){

//     check_identifier();
//     return 0;


// }

