#include <stdio.h>

extern "C" long int assign3();

int main(){
  long int return_code = 99;
  printf("%s", "Welcome to statistical numbers\n Brought to you by Justin Poblete\n");
  return_code = assign3();
  printf("%s%ld%s", "This is the C++ program responding. Here we recieved the number ", return_code, ". Have a nice day.\n
            The C++ will not return a zero to the operating system.");
}
