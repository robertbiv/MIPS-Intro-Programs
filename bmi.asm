#Robert Bennethum IV
#BMI Calculator
.data
      weight_in_kg: .asciiz "Enter weight (kg): "
      height_in_m: .asciiz "Enter height (m): "
      bmi_result: .asciiz "BMI: "

.text
.globl main
.ent main
main:
    #get weight
	li $v0, 4
    la $a0, weight_in_kg
    syscall
	li $v0, 5
	syscall
	move $t0, $v0

    #get height
	li $v0, 4
    la $a0, height_in_m
    syscall
	li $v0, 5
	syscall
	move $t1, $v0

    #Calc BMI
	mul $t1, $t1, $t1 #height^2
	div $t0, $t0, $t1 #weight/height

	#Print BMI
	li $v0, 4
    la $a0, bmi_result
    syscall
	li $v0, 1
    move $a0, $t0
	syscall

    #end
	li      $v0, 10
	syscall
.end main