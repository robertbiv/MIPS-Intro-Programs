.data
    enter_seconds: .asciiz "Enter seconds: "
    output_hrs: .asciiz "The time is Hours: "
    output_mins: .asciiz ", Minutes: "
    output_secs: .asciiz ", Seconds: "  

.text
.globl main
.ent main
main:
	#enter seconds
    li $v0, 4
    la $a0, enter_seconds
    syscall
    li $v0, 5
    syscall
    move $s0, $v0 

    #calc hrs
    li $t0, 3600
    div $s0, $t0
    mflo $s3 #hrs
    mfhi $s4 #extra sec

    #calc min
    li $t1, 60
    div $s4, $t1
    mflo $s5 #min (quotient)
    mfhi $s6 #sec (remainder)

    #print hrs
    li $v0, 4
    la $a0, output_hrs
    syscall
    li $v0, 1
    move $a0, $s3
    syscall

    #print mins
    li $v0, 4
    la $a0, output_mins
    syscall
    li $v0, 1
    move $a0, $s5
    syscall

    #print sec
    li $v0, 4
    la $a0, output_secs
    syscall
    li $v0, 1
    move $a0, $s6
    syscall

	# Exit program
	li      $v0, 10
	syscall
.end main