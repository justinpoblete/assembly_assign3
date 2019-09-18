#!/bin/bash



#Justin Poblete jpoblete4@csu.fullerton.edu
#CPSC 240
#Assignment 2



rm *.o
rm *.out
rm *.lis

echo "Assemble assign2.asm"
nasm -f elf64 -l assign3.lis -o assign3.o assign3.asm

echo "Compile driver.cpp"
g++ -c -Wall -m64 -std=c++14 -o driver.o -fno-pie -no-pie driver.cpp

echo "Link all object files"
g++ -m64 -std=c++14 -fno-pie -no-pie driver.o assign3.o -o test.out

echo "Now the program will run"
./test.out
