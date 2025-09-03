.data
    caffeine_content: .asciiz "Enter caffeine content (mg): "
    drink_size: .asciiz "Enter drink size (oz): "
    max_drink_to_death: .asciiz "Maximum drinks to reach lethal dose: "
    max_dose_mg: .word 10000  #10 gram

.text
.globl main
.ent main
main:
	#caffeine content
    li $v0, 4
    la $a0, caffeine_content
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  #caffeine content in mg

    #drink size
    li $v0, 4
    la $a0, drink_size
    syscall
    li $v0, 5
    syscall
    move $s1, $v0  #drink size in oz

    #calc max drink
    lw $t0, max_dose_mg
    mul $t1, $s0, $s1
    div $t0, $t1
    mflo $s2

    #print max
    li $v0, 4
    la $a0, max_drink_to_death
    syscall
    li $v0, 1
    move $a0, $s2
    syscall

	# Exit program
	li      $v0, 10
	syscall
.end main