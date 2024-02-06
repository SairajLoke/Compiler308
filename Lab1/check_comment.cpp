#include<iostream>
#include<stack>
#include<set>
#include <fstream>

using namespace std;
bool comment_started = false;  //changed 
int line = 0 ;
//logic for multi line commment
// --------------------------------------------
 /*
 */

// keep a bool that stores whether comment is started or not
// if /* is read...
// bool comment on ...
// if line ends but comment on...try reading nxt lines to find */
// if */ is reached then stop  

//----------------------------

int f(string input_str){
    cout<<" "<<line<<" "<<comment_started<<" ";
    int ptr = 0;
    while(ptr < input_str.size() && input_str[ptr] == ' ') ptr++;
    // cout<<input_str[ptr]<<endl;

    if(ptr < (input_str.size()-2) && input_str[ptr] == '/' && input_str[ptr+1] == '*' && input_str[ptr+2]== '/'){cout<<"not a comment"<<endl; return 0;}

    if(input_str[ptr] == '/' && input_str[ptr+1] == '*'){ comment_started= true;cout<<"comment started"<<endl; return 0;}


    if(ptr + 1 >= input_str.size() || (input_str[ptr] != '/' && !comment_started)){ //changed   
        cout<<" thise not a comment\n"; return 0;
    }


    if(input_str[ptr + 1] == '/' ){
        cout<<"comment\n"; return 1;
    }else if(input_str[ptr + 1] != '*' && !comment_started){
        cout<<"there not a comment\n"; return 0;
    }else{
        ptr += 2;//to avoid /*/
    }

    // if(input_str[ptr] == '/' && input_str[ptr+1] == '*'){ comment_started= true;cout<<"comment started"<<endl; return 0;}
    
    bool endOfComment = false;
    while(ptr < input_str.size() - 1 && !endOfComment){
        if(input_str[ptr] == '*' && input_str[ptr + 1] == '/' && comment_started == true){
            if(ptr + 1 == input_str.size() - 1){
                cout<<"commento"; return 1;//comment completed
            }else{
                endOfComment = true; ptr++;
            }
        }
        ptr++;
    }
    

    while(ptr < input_str.size() && input_str[ptr] == ' ') ptr++;
    if(ptr == input_str.size() && endOfComment){
        cout<<"a comment"; 
    }else{
        if(!comment_started){cout<<"here not a comment\n"; }
    }

    return 0;
}

int main() {
    string inputstr;
    ifstream ftest("comment_tests.txt");
    // std::getline(ftest, inputstr) ; 
    // cout<<"----"<<inputstr<<endl;
    bool multi_line = true;

    if( multi_line ){
        while(std::getline(ftest, inputstr)){
            line += 1;
            std::cout<<" : "<<inputstr; f(inputstr);
            
        }
        ftest.close() ; 
    }
    else{//single line
        return 0 ;
    }

    return 0;
}
