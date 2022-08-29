main:
        li $t0, -1
        li $t1, 0


# case (i){
#   0:  print "zero"
#   1:  print "one"
#   2:  print "two"
#   default:  print "default"
# }
                .data
zero_string:    .asciiz "zero\n"
one_string:     .asciiz "one\n"
two_string:     .asciiz "two\n"
default_string: .asciiz "default\n"

            .text
            beq $t0, $zero, zero
            li $t9, 1
            beq $t0, $t9, one
            li $t9, 2
            beq $t0, $t9, two
            j default

zero:       li $v0, 4
            la $a0, zero_string
            syscall
            j end_case

one:        li $v0, 4
            la $a0, one_string
            syscall
            j end_case

two:        li $v0, 4
            la $a0, two_string
            syscall
            j end_case

default:    li $v0, 4
            la $a0, default_string
            syscall
            j end_case

end_case:
            li $t0,0
            li $t1,1
            # if ($t0=$t1)
            #   print "Hello"
            # else
            #   print "World"
            beq $t0, $t1, if
            j   else

if:         .data
Hello:      .asciiz "Hello\n"
            .text
            li $v0, 4
            la $a0, Hello
            syscall
            j end_if

else:       .data
World:      .asciiz "World\n"
            .text
            li $v0, 4
            la $a0, World
            syscall
end_if:
            li $vo, 10
            syscall