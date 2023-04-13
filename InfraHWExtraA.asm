.data
	msg0: .asciiz "Informe a quantidade de alunos: "
	msg1: .asciiz "Digite a primeira nota do aluno: "
	msg2: .asciiz "Digite a segunda nota do aluno: "
	msg3: .asciiz "Digite a frequência do aluno: "
	msg4: .asciiz " Aprovado! \n"
	msg5: .asciiz " Reprovado! \n"
	msg6: .asciiz "A média do aluno foi: "
	msg7: .asciiz ", a sua frequência foi de: "
		
	nota1: .float 0.0
	nota2: .float 0.0 
	divisor: .float 2.0
	soma: .float 0.0
	media: .float 0.0
	zero: .float 0.0
	sete: .float 7.0
	contador: .word 0
	
	alunos: .word 4
	frequencia: .word 75
	
.text
	
		lw $a3, alunos			
	
	main:
	
		addi $a2, $a2, 1
	
	#Imprimir a primeira mensagem
	
		li $v0, 4
		la $a0, msg1
		syscall

	#capturar a primeira nota

		li $v0, 6
		syscall

		lwc1 $f1, zero
		lwc1 $f2, nota1
				
		add.s $f2, $f0, $f1

	#Imprimir a segunda mensagem

		li $v0, 4
		la $a0, msg2
		syscall

	#capturar a segunda nota 
	
		li $v0, 6
		syscall
	
		lwc1 $f3, nota2
		add.s $f3, $f0, $f1
	
	#setar o dividendo
	
		lwc1 $f4, divisor
	
	#calcular media
	
		lwc1 $f5, soma
	
		add.s $f5, $f2, $f3
	
	# Realizar divisão
	
		lwc1 $f6, media
	
		div.s $f6, $f5, $f4
	
		add.s $f12, $f6, $f1

	# Imprimir a terceira mensagem

		li $v0, 4
		la $a0, msg3
		syscall

	# capturar frequencia

		li $v0, 5
		syscall

		move $t0, $v0

	# Imprimir resultado

		li $v0, 4
		la $a0, msg6
		syscall


		li $v0, 2
		syscall
	
		li $v0, 4
		la $a0, msg7
		syscall
	
	
		li $v0, 1
		move $a0, $t0
		syscall
		
		lwc1 $f7, sete	
	
		c.eq.s $f12, $f7
	
		bc1t exit
	
		li $v0, 4
		la $a0, msg5
		syscall	
		
		bne $a2, $a3, main
		
		
		li $v0, 10
		syscall
	
	exit:
		
		lw $a1, frequencia
		bge $a0, $a1, printarResultado
		
		li $v0, 4
		la $a0, msg5
		syscall	
	
		bne $a2, $a3, main
	
		li $v0, 10
		syscall
		
		
		printarResultado:	
		
			li $v0, 4
			la $a0, msg4
			syscall
			
			bne $a2, $a3, main
			