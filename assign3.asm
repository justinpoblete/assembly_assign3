;Justin Poblete jpoblete4@csu.fullerton.edu
;CPSC 240
;Assignment 3


global assign3
extern printf
extern scanf
extern getchar


segment .data

;-----Messages------


initialmessage db "We will compute the mean for you using only integers.",10,0

promptmessage1 db "Enter a sequence of long integers separated by white space. After the last input press Control+D. ", 0

numbers_entered db 10,"The number of numbers entered was %ld.",10,0

mean db "The integer mean was %ld.", 10 , 0

more_sets db "Do you have more sets of integers to process (y or n)? ", 0

come_again db "Justin hopes you liked your means. Please come again.",10, 0

lastmessage db "This software will return the last mean to the driver program. Bye ",10, 0

stringformat db "%s", 0

integerformat db "%ld", 0

test1 db "Testing r12: %d", 10, 0



segment .bss
;empty

segment .text

assign3:

push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14
push       r15                                              ;Back up r15



;--------initial message

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, initialmessage
call      printf

;--------prompt for set

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, promptmessage1
call      printf

;-------obtain set

mov        r15, 0       ;counter = 0
mov        r13, 0
begin_loop:

push qword 0
mov qword  rax, 0
mov        rdi, integerformat
mov        rsi, rsp
call       scanf

cdqe                    ;extend eax to all of rax

cmp        rax, -1
je         loop_finished
mov      r14, [rsp]   ;grab number
add        r13, r14     ;add to r13
pop        rax
inc        r15          ;increment counter
jmp        begin_loop

loop_finished:
pop       rax


;------display numbers entered

mov qword rax, 0
mov       rdi, numbers_entered
mov       rsi, r15
call      printf

;------calculate mean

mov      rax, r13
mov      rbx, r15
cqo
idiv     rbx
mov      r13, rax

;-------display mean

mov qword rax, 0
mov       rdi, mean
mov       rsi, r13
call      printf

;------ask again for more sets

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, more_sets
call      printf

;------get char

mov       rax, 0
mov       rdi, integerformat
push      qword 0
mov       rsi, rsp
call      getchar
pop       r12

;-------test1 display r12

mov qword rax, 0
mov       rdi, test1
mov       rsi, r12
call      printf

;-------last Message

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, lastmessage
call      printf

;------return last mean

mov   rax, r13

pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                                               ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
pop        rbp                                              ;Restore rbp

ret
