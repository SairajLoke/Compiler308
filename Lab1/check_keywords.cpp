#include<iostream>
#include<vector>
#include<set>
#include <fstream>

using namespace std;

//ref for keywords
// https://en.cppreference.com/w/cpp/keyword
// I have ignored keywords for c++20


int main(){

    set<string> keywords_set ; //no find in unordered set
    ifstream keywordsfile("keywords.txt");
    string keyline;
    while(std::getline(keywordsfile,keyline)){
        // std::cout<<keyline<<endl;
        keywords_set.insert(keyline);
    }
    keywordsfile.close() ; 
   std::cout<<"My kewords set size"<<keywords_set.size()<<endl;

    string inputstr ;
    set<string> keywords_present ; //no find in unordered set
    
    // for(auto i : keywords_set){ //to confirm the set is what i want it to be
    //     if (keywords_set.find("break") != keywords_set.end()){
    //         cout<<"hai"<<endl;
    //         return 0;
    //     }
    // }


    int keyword_count = 0 ;
    getline(cin, inputstr);
    
    for(int i = 0 ; i<inputstr.size() ; ++i){
        string word = "";
        while(i < inputstr.size() && inputstr[i] == ' ') {i++;}

        while(inputstr[i] != ' ' && i < inputstr.size() ){
            word += inputstr[i];
            ++i;
        }
        cout<<word<<endl;

        if(keywords_set.find(word) != keywords_set.end()){
            keyword_count++ ; 
            keywords_present.insert(word);   
            std::cout<<word<<endl;
            // std::cout<<keyword_count<<endl ;
        }
    }
    cout<<"# of keywords "<<keyword_count<<endl ;
    return 0;
}



