.data
	mensagem: .asciiz "Digite a temperatura em grau Celcius: "
	convercao: .float 1.8
	soma: .float 32.0 
	zero: .float 0.0
	resultado: .float 0.0	
	
.text
	
	main:
		
		lwc1 $f1, convercao
		lwc1 $f2, soma
		lwc1 $f3, resultado
		lwc1 $f5, zero	
		
		li $v0, 4
		la $a0, mensagem
		syscall
	
		li $v0, 6
		syscall
		
		jal calcularFH
		
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall
		
		calcularFH:
		
			mul.s $f3,$f0,$f1 
	
			add.s $f4,$f3,$f2	

			add.s $f12, $f4, $f5
			
			jr $ra
		
