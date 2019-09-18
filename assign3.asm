;Justin Poblete jpoblete4@csu.fullerton.edu
;CPSC 240
;Assignment 3


global assign3
extern printf
extern scanf

segment .data

;-----Messages------


initialmessage db "The X86 program has begun",10,0

promptmessage1 db "Please enter the first integer and press enter:  ", 0

promptmessage2 db "Please enter the second integer and press enter:  ", 0

thanks db "Thank you. ", 10 , 0

quotient_message1 db "The quotient of %ld", 0
quotient_message2 db " divided by %ld", 0
quotient_message3 db " is %ld", 0
quotient_message4 db " with remainder equal to %ld", 10, 0

positive_message db "The remainder is positive.", 10, 0
negative_message db "The remainder is negative.", 10, 0
zero_message db "Sorry: we do not handle zero here at Ubuntu dot com.", 10, 0
zero_message2 db "Please run this program again. ", 10, 0
zero_message3 db "Negative 1 will be returned to the caller program. Have a nice day. ", 10, 0

return_message db "The remainder will be returned to the caller program. Have a nice day.", 10, 0

stringformat db "%s", 0

integerformat db "%ld", 0

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

;--------prompt for first int

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, promptmessage1
call      printf

;-------obtain first int

mov       rax, 0
mov       rdi, integerformat
push      qword 0
mov       rsi, rsp
call      scanf
pop       r15


;--------prompt for second int

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, promptmessage2
call      printf

;-------obtain second int

mov       rax, 0
mov       rdi, integerformat
push     qword 0
mov       rsi, rsp
call      scanf
pop       r14

;------zero_message

cmp       r14, 0
je        equalzero
jmp       continue3
equalzero:
mov qword rax, 0
mov       rdi, stringformat
mov       rsi, zero_message
call      printf

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, zero_message2
call      printf

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, zero_message3
call      printf

mov rax, -1


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

continue3:

;------thanks

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, thanks
call      printf

;-------divide the two ints

mov       rax, r15
mov       rbx, r14
cqo
idiv      rbx
mov       r13, rax    ;answer
mov       r12, rdx    ;remainder

;-------quotient_message1

mov qword rax, 0
mov       rdi, quotient_message1
mov       rsi, r15
call      printf

;-------quotient_message2

mov qword rax, 0
mov       rdi, quotient_message2
mov       rsi, r14
call      printf

;-------quotient_message3

mov qword rax, 0
mov       rdi, quotient_message3
mov       rsi, r13
call      printf

;-------quotient_message4

mov qword rax, 0
mov       rdi, quotient_message4
mov       rsi, r12
call      printf

;------positive_message

cmp       r12, 0
jg        greaterthan
jmp       continue1
greaterthan:
mov qword rax, 0
mov       rdi, stringformat
mov       rsi, positive_message
call      printf
continue1:

;------negative_message

cmp       r12, 0
jl        lessthan
jmp       continue2
lessthan:
mov qword rax, 0
mov       rdi, stringformat
mov       rsi, negative_message
call      printf
continue2:

;------return_message

mov qword rax, 0
mov       rdi, stringformat
mov       rsi, return_message
call      printf



;------return 5

mov rax, r12


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
