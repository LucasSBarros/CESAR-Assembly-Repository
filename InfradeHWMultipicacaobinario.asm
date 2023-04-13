.data
msg1: .asciiz "Digite o multiplicando: "
msg2: .asciiz "Digite o multiplicador: "
msg3: .asciiz "o produto é: "
multiplicando: .word 0
multiplicador: .word 0
produto: .word 0
contador: .word 0
.text
 
# setar multiplicador
	li $v0, 4
	la $a0, msg1
	syscall	

	li $v0, 5
	syscall

	move $t1, $v0
		
		
# setar multiplicando
	li $v0, 4
	la $a0, msg2
	syscall	
	li $v0, 5
	syscall

	move $t2, $v0

	
# Setar produto	e contador
	lw $t3, produto
	lw $t4, contador
	
# Pegar o bit menos significativo
	for:
		bge $t4, 32, exit
		andi $t5, $t1, 1
		beq $t5, 0, drag
		add $t3, $t3, $t2
		j drag
		drag:
	  		sll $t2, $t2, 1
	  		srl $t1, $t1, 1
	  		add $t4, $t4, 1
	  		j for
	exit:
		
		li $v0, 4
		la $a0, msg3
		syscall	
		
		li $v0, 1
		move $a0, $t3
		syscall
		
	  	
	  			  
	      
	
	
	
	
	
	