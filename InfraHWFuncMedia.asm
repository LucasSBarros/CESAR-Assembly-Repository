.data
	msg1: .asciiz "Digite a primeira nota do aluno: "
	msg2: .asciiz "A nota da AV2 precisa ser: "

		
	nota1: .float 0.0
	# nota2: .float 0.0 
	subtracao: .float 14.0
	zero: .float 0.0
	
.text
	
	main:
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 6
		syscall

		lwc1 $f1, zero
		lwc1 $f2, nota1
		lwc1 $f3, subtracao
				
		add.s $f2, $f0, $f1
		
		jal FuncMedia
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall
		
	FuncMedia:
		sub.s $f4, $f3, $f2
		add.s $f12, $f4, $f1
		jr $ra
		