#calc every square until greater than input, 
#then output last square root
.data
    input : .asciiz "Input (non-negative int): " 
    output : .asciiz "Output: " 

.text
.globl main
.ent main
main:
	#input
    li $v0, 4
    la $a0, input
    syscall
    li $v0, 5
    syscall
    move $s0, $v0 

    #calc sqrt
    li $s1, 0
    li $s2, 1
    ble $s0, $zero, out

loop:
    addi $s1, $s1, 1
    mul $t0, $s1, $s1
    bgt $t0, $s0, out
    j loop

out:
    #output
    li $v0, 4
    la $a0, output
    syscall
    addi $a0, $s1, -1   # output $s1 - 1
    li $v0, 1
    syscall

	# Exit program
	li      $v0, 10
	syscall
.end main