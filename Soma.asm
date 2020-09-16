.data
	N1: .asciiz "Digite o 1o numero: "
	N2: .asciiz "Digite o 2o numero: "
	Resposta: .asciiz "O resultado = "
	
	# Procedimento: 1o) Carregar a string para um ENDEREÇO MP
	# 2o) Carregar o conteúdo do END. MP para um REGISTRADOR 
.text
	li $v0,4 #COD 4: pede ao SO que imprima uma STRING na tela;
	#v0 tem o COD da acao que o SO ira executar
	la $a0,N1
	syscall 

	li $v0,5 #COD 5: pede ao SO que leia um INT do teclado
	syscall
	
	move $t0, $v0 #t0 = v0 = N1
	
	li $v0,4
	la $a0,N2
	syscall 
	
	li $v0,5
	syscall
	
	move $t1, $v0 #t1 = v0 = N2
	
	#add $t2, $t1, $t0 # t2 = t1 + t0
	
	sub $t2, $t0, $t1 # t2 = t1 - t0
	
	#testando as instrucoes!!
	
	li $v0,4
	la $a0,Resposta
	syscall 
	
	li $v0, 1 #COD 1: pede ao SO que imprima um INT na tela
	move $a0, $t2 # a0 = t2
	syscall 
	
	
	
