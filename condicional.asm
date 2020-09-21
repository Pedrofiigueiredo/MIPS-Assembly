# Este programa recebe dois valores pelo usuário,
# se os valores forem iguais, são multiplicados,
# se forem diferentes, são somados.

# -- Registradores usados --
# $t0 -> N1
# $t1 -> N2
# $t2 -> resultado da operação

.data # Declaração de variáveis
	N1: .asciiz "Digite o 1o numero: "
	N2: .asciiz "Digite o 2o numero: "
	Resposta: .asciiz "O resultado: "

.text
	# Imprimir mensagem N1 na tela
	li $v0, 4										# código 4 -> imprimir string
	la $a0, N1										# Carregar em $a0 a variável N1 ($a0 registrador padrão)
	syscall											# Executa
	
	# Ler um inteiro digitado pelo usuário
	li $v0, 5										# código 5 -> ler int do teclado
	syscall
	move $t0, $v0									# Uma cópia do valor lido
	
	# Imprimir a mensagem N2 na tela
	li $v0, 4
	la $a0, N2
	syscall
	
	# Ler outro inteiro digitado pelo usuário
	li $v0, 5
	syscall
	move $t1, $v0
	
	# $t0 -> N1 | $t1 -> N2
	
	# Comparando os valores lidos					# if (a != b) soma os números; else multiplica-os
	beq $t0, $t1, else								# BEQ -> branch if equal
	add $t2, $t1, $t0
	j resposta										# Não passar pelo 'bloco' de label else
	
	else:
		mul $t2, $t1, $t0
		
	resposta: 
		# Imprimir a mensagem Resposta na tela
		li $v0, 4
		la $a0, Resposta
		syscall
		
		# Imprimir o resultado da operação na tela
		li $v0, 1									# Código 1 -> imprimir int
		move $a0, $t2
		syscall
		