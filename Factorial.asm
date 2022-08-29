        .data
q:      .asciiz "Enter an Integer: "
r:      .asciiz "Factorial is "
nl:     .asciiz "\n"
        .text
main:      
        # Query the user for an integer
        li $v0, 4
        la $a0, q
        syscall

        li $v0, 5
        syscall
        move $t0, $v0   # The requested integer is in $t0.

        #Compute the factorial of the integer
        # for (int i = 1, x = 1, i <=n, i++)

        li $t2, 1 # counter
        li $t1, 1 # result

loop:   bgt $t2, $t0, endLoop
        mul $t1, $t1, $t2
        addi $t2, $t2, 1
        j loop

endLoop:

        # Display the results of the computation
        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, r
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        li $v0, 10
        syscall
