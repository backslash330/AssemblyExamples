        # while (i<n)
        #     if ((n%i)==0){
        #         print "i, ";
        #         n /= i;
        #     } else{
        #         i++;
        #     }
        # print "n.\n";

        .data
q:      .asciiz "Enter a number to factor: "
r:      .asciiz "The prime factorization of "
r2:     .asciiz " is "
comma:  .asciiz ", "
nl:     .asciiz ".\n"
        .text
main:
        #request a number from the user
        li $v0, 4
        la $a0, q
        syscall

        li $v0, 5
        syscall
        move $t0, $v0 #store the number in $t0

        # Display beginning of the result message
        li $v0, 4
        la $a0, r
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, r2
        syscall

        # Calculate the prime factors of the number in $t0
        li $t1, 2 #counter

while:  bge $t1, $t0, endWhile
        div $t0, $t1
        mfhi $t2 #store the remainder in $t2
        bnez $t2, else

        li $v0, 1
        move $a0, $t1 #display the prime factor
        syscall

        li $v0, 4
        la $a0, comma
        syscall

        mflo $t0 #store the quotient in $t0
        j while

else:   addi $t1, $t1, 1
        j while

endWhile:      

        li $v0, 1
        move $a0, $t0 #display the final quotient
        syscall

        li $v0, 4
        la $a0, nl
        syscall

        # Exit the program
        li $v0, 10
        syscall

