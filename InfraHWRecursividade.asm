.data

	mensagem: .asciiz "Digite um número para o cálculo do fatorial: "
	fatorial: .asciiz " é o resultado em fatorial"

.text

	main:

		li $v0, 4
		la $a0, mensagem
		syscall

		li $v0, 5
		syscall
		move $a0, $v0
		jal calcFatorial

		move $a0, $v0
		li $v0, 1
		syscall

		li $v0, 4
		la $a0, fatorial
		syscall

		li $v0, 10
		syscall

	calcFatorial:
		sub $sp, $sp, 8 
		sw $ra, 4($sp) 
		sw $a0, 0($sp)

		slti $t0, $a0, 1 
		beq $t0, $zero, L1

		li $v0, 1
		add $sp, $sp, 8 
		jr $ra

	L1: 
		sub $a0, $a0, 1
		jal calcFatorial

		lw $a0, 0($sp)
		lw $ra, 4($sp)
		add $sp, $sp, 8

		mul $v0, $a0, $v0
		jr $ra