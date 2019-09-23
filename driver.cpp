#include <stdio.h>

extern "C" long int assign3();

int main(){

  long int return_code = 99;

  printf("%s", "Welcome to statistical numbers\nBrought to you by Justin Poblete\n");

  return_code = assign3();

  printf("%s%ld%s\n","This is the C++ program responding. Here we recieved the number ",return_code,".Have a nice day.\nThe C++ program will not return a zero to the operating system.");

}
