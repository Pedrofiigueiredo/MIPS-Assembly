.data
	N1: .asciiz "Digite o 1o número: "
	N2: .asciiz "Digite o 2o número: "
	Resposta: .asciiz "O resultado = "
	
	# Procedimento: 1o) Carregar a string para um END, MP
	# 2o) Carregar o conteúdo do END. MP para o registrador
	
.text
	li $v0, 4
	la $a0, N1
	syscall # Todas as chamadas no MIPS são feitas por chamadas do sistema
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 5
	la $a0, N2
	syscall
	
	move $t1, $v0