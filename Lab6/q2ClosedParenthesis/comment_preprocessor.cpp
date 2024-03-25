#include<iostream>
#include<stack>
#include<set>
#include <fstream>

/*
Sairaj Loke's processor that removes comments  from any file
210001035 
*/
using namespace std;
bool comment_started = false;  //changed 
int line = 0 ;
bool thisiscomment = 0;  
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
    int endptr = input_str.size() -1 ;

    //remove front blank and end blank
    while(ptr < input_str.size() && input_str[ptr] == ' ') ptr++;
    while(input_str[endptr] == ' '){ endptr--; }
    input_str = input_str.substr(ptr,endptr-ptr+1);
    // cout<<"@blank removal : "<<input_str<<endl<<" "<<input_str.size();
    ptr=0;

    //special base case /*/
    if(ptr < (input_str.size()-2) && input_str[ptr] == '/' && input_str[ptr+1] == '*' && input_str[ptr+2]== '/'){cout<<"not a comment"<<endl; thisiscomment=0; return 0;}

    //safe way to check if /* started or not
    if(input_str[ptr] == '/' && ptr < input_str.size() && input_str[ptr+1] == '*'){ 
        comment_started= true;
        cout<<" comment started"; 
        thisiscomment = 1;

        //shouldnt return 1 as this comment can end on same line (/*a afafa */)
    }

    // cout<<"\n-----"<<ptr<<" "<<input_str<<" "<<comment_started<<endl;
    //checking first element(not idx 0 as line could have blank space in the start), if it is the last, then just return 0 
    // as for it to be a comment req at least 2chars 
    // except if the comment is already started
    // cout<<input_str[ptr]<<" ****** "<<ptr<<endl;
    if(ptr >= (input_str.size()-1) || (input_str[ptr] != '/' && !comment_started)){ //changed   
        cout<<" this not a comment"; thisiscomment= 0; return 0;
    }

    // if // then directly return comment true
    if(input_str[ptr]== '/' && input_str[ptr + 1] == '/' ){
        cout<<"comment//"; thisiscomment= 1; return 1;
    }
    //if */ (blank removed) then return 1 and comment over
    else if(input_str[ptr] == '*' && input_str[ptr + 1] == '/' && comment_started == true){
            if(ptr + 1 == input_str.size() - 1){
                cout<<"commentover"; thisiscomment= 1; comment_started=false;return 1;
            }
    }
    else if(input_str[ptr + 1] != '*' && !comment_started){
        cout<<"there not a comment"; thisiscomment= 0; return 0;
    }else{
        ptr += 2;//to avoid /*/
    }

    // if(input_str[ptr] == '/' && input_str[ptr+1] == '*'){ comment_started= true;cout<<"comment started"; return 0;}
    


    bool endOfComment = false;
    while(ptr < input_str.size() - 1 && !endOfComment){

        if(input_str[ptr] == '*' && input_str[ptr + 1] == '/' && comment_started == true){
            if(ptr + 1 == input_str.size() - 1){
                cout<<"commentover"; thisiscomment= 1; comment_started=false;return 1;//comment completed
            }else{
                
                endOfComment = true;  ptr++; cout<<"$$end of comment"<<endl; return 0;
                //not considering this case...
                // basically  of the form :    afoanfo */ fafa 
                // this will not run in case of ... */     (blank space as end blank is also removed above)
            }
        }
        ptr++;
    }
    

    while(ptr < input_str.size() && input_str[ptr] == ' ') ptr++;
    if(ptr == input_str.size()-1 && endOfComment){ //latest -1 added
        cout<<"a comment"; thisiscomment= 1; return 0;
    }else{
        if(!comment_started){cout<<"here not a comment"; thisiscomment= 0; return 0;}
    }

    //NOTE: lines till this end inlcude:
        // 1. when comment_started (and not yet ended)
        // 2. any other?
    // cout<<"\n-----"<<ptr<<" "<<input_str<<" "<<comment_started<<endl;
    // thisiscomment=0;

    return 0;
}

int main() {

    string inputstr;
    ifstream ftest("q2input.c");
    ofstream fpreprocessed("q2preprocessed.txt");

    // std::getline(ftest, inputstr) ; 
    // cout<<"----"<<inputstr<<endl;
    bool multi_line = true;

    if( multi_line ){
        while(std::getline(ftest, inputstr)){
            line += 1;
            // if(inputstr.size() ==0){continue;}

            std::cout<<"\n : "<<inputstr; f(inputstr);
            if(!thisiscomment){ fpreprocessed<<inputstr<<endl;}
            
        }
        ftest.close() ; 
        fpreprocessed.close();
    }
    else{//single line
        return 0 ;
    }

    cout<<endl;
    return 0;
}
