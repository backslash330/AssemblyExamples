        .data
nl:     .asciiz "\n"
        .text
main:

        li $t0,2
        li $t1,7
        li $t2,5
        li $t3,8
        #add t0 and t3
        add $a0,$t0,$t3         # $a0 = 2 + 8 = 10
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #add t2 and 17
        add $a0,$t2,17
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #subtract t0 and t1
        sub $a0,$t0,$t1
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #multiply t1 and t2
        #and print lower 32 bits of result
        mult $t1,$t2
        mflo $a0
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #print upper 32 bits of result
        mfhi $a0
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #divide t1 and t2. print the lower 32 bits of the result
        #this is the qoutient
        div $t1,$t2
        mflo $a0
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #print upper 32 bits of result
        #this is the remainder
        mfhi $a0
        li $v0,1
        syscall

        #newline
        la $a0,nl
        li $v0,4
        syscall

        #exit
        li $v0,10
        syscall
