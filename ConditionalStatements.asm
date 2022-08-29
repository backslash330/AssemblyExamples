main:

        li $t0, 0
        li $t1, 1

        .data
Hello:  .asciiz "Hello\n"
World:  .asciiz "World!\n"
        .text


        
        # If t0 is not equal to t1, jump to label print_world:
        bne $t0, $t1, print_world
        # Under here t0 is equal to t1.
        # Print "Hello"
        la $a0, Hello
        li $v0, 4
        syscall

print_world:
        li $v0, 4
        la $a0, World
        syscall

        # If $t0 != $t1, print "Hello"
        beq $t0, $t1, end_if
        la $a0, Hello
        li $v0, 4

end_if:
        li $v0, 4
        la $a0, World
        syscall


        # example of an if-else statement
        # if $t0 < $t1, print "If"
        # else print "Else"
        # THE TRICK IS TO LOOK FOR THE OPPOSITE OF THE CONDITION
        # AND USE IT IN THE ELSE STATEMENT
        .data
if:     .asciiz "If\n"
else:   .asciiz "Else\n"
        .text
        bge $t0, $t1, else1
        la $a0, if
        li $v0, 4
        syscall
        j end_if1
else1:
        la $a0, else
        li $v0, 4
        syscall
end_if1:

        # exit
        li $v0, 10
        syscall
        # End of main