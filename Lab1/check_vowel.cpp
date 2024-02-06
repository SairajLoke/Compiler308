#include<iostream>
#include<vector>
#include<set>

using namespace std;

int main(){

    set<char> vowels = {'a','e','i','o','u', 'A','E','I','O','U'};
    string s = "";
    // cin>>s;
    getline(cin, s);
    cout<<"parsing "<<s<<endl;

    int vcount = 0 ;
    int ccount = 0 ;
    set<char> distinct_vowels = {};

    for(auto i:s){
        if(vowels.find(i) != vowels.end()) { vcount++; distinct_vowels.insert(i); }
        else if( (97<=int(i) && int(i) <= 122)  || (65 <=  int(i)  &&  int(i) <= 90 )  ){
            ccount++ ;    
        }
    }
    cout<<"vowels: "<<vcount<<", distinct vowels "<<distinct_vowels.size()<<", consonents: "<<ccount ;
    return 0;
}