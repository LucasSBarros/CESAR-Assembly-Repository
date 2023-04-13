.data

mensagem1: .asciiz "*** SEQUÊNCIA DE FIBONACCI ***\n\n"
mensagem2: .asciiz "Digite um número inteiro: "
mensagem3: .asciiz "O valor de Fibonacci é: "
mensagem4: .asciiz "O valor de Fibonacci é: 0"

.text

# imprimir mensagem1
	li $v0, 4
	la $a0, mensagem1
	syscall

# imprimir mensagem2
	li $v0, 4
	la $a0, mensagem2
	syscall
	
# Leitura da Entrada
	li $v0, 5
	syscall

	beq $v0, 0, igualAZero

# Chamar função
	move $a0, $v0
	jal fibonacci
	move $a1, $v0 # save return value to a1

# imprimir mensagem3
	li $v0, 4
	la $a0, mensagem3
	syscall

# imprimir resultado
	li $v0, 1
	move $a0, $a1
	syscall


	li $v0, 10
	syscall

## Função fibonacci
	fibonacci:
		addi $sp, $sp, -12
		sw $ra, 8($sp)
		sw $s0, 4($sp)
		sw $s1, 0($sp)
		move $s0, $a0
		li $v0, 1 
		ble $s0, 0x2, fibonacciExit 
		addi $a0, $s0, -1 
		jal fibonacci
		move $s1, $v0 
		addi $a0, $s0, -2 
		jal fibonacci
		add $v0, $s1, $v0 
	
	fibonacciExit:
		lw $ra, 8($sp)
		lw $s0, 4($sp)
		lw $s1, 0($sp)
		addi $sp, $sp, 12
		jr $ra


	igualAZero:
		li $v0, 4
		la $a0, mensagem4
		syscall