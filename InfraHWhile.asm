.data

msg0: .asciiz "\n"

.text

	li $t0, 1
	li $t1, 0

	loop:
		beq $t0,$zero,exit
		li $v0, 5
		syscall

		move $t0, $v0
		
		add $t1,$t1,$t0

		j loop  


	exit:
	
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, msg0
		syscall