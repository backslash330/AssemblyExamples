#simple example of how to output text in assembly language
        .data
one:    .asciiz "This is a string one!\n"
two:   .asciiz "This is a string two!\n"
        .text
        # this is the entry point of the program
main:   li $v0, 4
        la $a0, one
        syscall
        la $a0, two
        syscall

        .data
hello: .asciiz "Hello World!\n"
        .text
        
        # this is the entry point of the program
        la $a0, hello
        syscall

        # the call below exits the program
        li $v0, 10
        syscall
    