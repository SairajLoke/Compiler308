#include <bits/stdc++.h>
using namespace std;


int main () {
  string line;
  string fileName;
  cout<<"Enter filepath : ";
  // cin>>fileName; for testing ..using tokenizer txt file
  ifstream myfile ("q3_tokenizer_test.txt");

  int num_lines=0;
  int num_spaces=0;
  int num_chars=0;

  if (myfile.is_open())
  {
    while ( getline (myfile,line) )
    {
      for(auto x : line){
        num_chars++;
        if(x==' '){num_spaces++;}
      }
      num_lines++;
    }
    myfile.close();
  }else{cout<<"Could not open the file. check path/name.";return 0;}
    
  cout<<"Num of characters are "<<num_chars<<", out of which spaces: "<< num_spaces<<"and this file contains "<<num_lines<<" num of lines.";
//   else cout << "Unable to open file"; 

  return 0;
}