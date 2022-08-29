power:  bne     $a1, $zero, recursion   # If the power is greater than 1, then do the recursion
        li      $v0, 1                  # Otherwise, return 1
        jr		$ra					
recursion:
        addi    $sp, $sp, -4            # Allocate space for one integer on the stack
        sw      $ra, 0 ($sp)            # Store the return address on the stack
        addi    $a1, $a1, -1            # Decrement the power by 1
        jal		power                   # Call the power function with the new parameters
        mul     $v0, $a0, $v0           # Multiply the result by the base and store it in $v0
        lw      $ra, 0 ($sp)            # REstore the return address from the stack
        addi    $sp, $sp, 4             # Deallocate the space on the stack
        jr      $ra                     # Return to the caller

main:   li      $a0, 5
        li      $a1, 3
        jal     power                   # Compute 5^3

        move    $a0, $v0
        li      $v0, 1
        syscall


        li      $v0, 10
        syscall
        
        