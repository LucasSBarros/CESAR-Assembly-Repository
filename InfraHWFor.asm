.data

msg0: .asciiz "\n"

.text

	li $t0, -1

	loop:
		bgt $t0,9,exit
		addi $t0,$t0,1

		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, msg0
		syscall

		j loop  


	exit:
