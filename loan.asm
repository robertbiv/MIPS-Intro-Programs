.data
    loan_amount: .asciiz "Enter loan amount: $"
    interest_rate: .asciiz "Enter interest rate (as %): "
    years: .asciiz "Enter years: "
    simple_interest: .asciiz "Simple interest: "

.text
.globl main
.ent main
main:
	#loan amount
    li $v0, 4
    la $a0, loan_amount
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    #interest rate
    li $v0, 4
    la $a0, interest_rate
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    #years
    li $v0, 4
    la $a0, years
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    #calc simple interest
    mul $t0, $s0, $s1
    li $t2, 100
    div $t0, $t2
    mflo $t3 #get interest
    mul $s3, $t3, $s2 # * years

    #print simple interest
    li $v0, 4
    la $a0, simple_interest
    syscall
    li $v0, 1
    move $a0, $s3
    syscall

	# Exit program
	li      $v0, 10
	syscall
.end main