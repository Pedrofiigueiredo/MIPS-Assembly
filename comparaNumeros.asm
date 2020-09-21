# Este programa recebe 3 números do usuário e verifica
# qual é o maior o menor e, consequentemente, o do meio.

# -- Registradores usados --
# $t0 -> temporario
# $t1 -> 1o numero
# $t2 -> 2o numero
# $t3 -> 3o numero

.data
	N1: .asciiz "Digite o 1o numero: "
	N2: .asciiz "Digite o 2o numero: "
	N3: .asciiz "Digite o 3o numero: "
	
	Maior: .asciiz "\nO maior numero e: "
	Meio: .asciiz "\nO numero do meio e: "
	Menor: .asciiz "\nO menor numero e: "
	
.text
	# ENTRADAS
	# Imprimir a mensagem N1
	li $v0, 4									
	la $a0, N1
	syscall
	
	# Receber o 1o inteiro do usuário
	li $v0, 5									
	syscall
	move $t1, $v0							# $t1 -> 1o número

	# Imprimir a mensagem N2
	li $v0, 4									
	la $a0, N2
	syscall
	
	# Receber o 2o inteiro do usuário
	li $v0, 5									
	syscall
	move $t2, $v0							# $t2 -> 2o número
	
	# Imprimir a mensagem N3
	li $v0, 4											
	la $a0, N3
	syscall
	
	# Receber o 3o inteiro do usuário
	li $v0, 5											
	syscall
	move $t3, $v0							# $t3 -> 3o número
	
	
	# VERIFICAÇÃO
								
	# Algoritmo
	# (1) Comparar os dois últimos
	# (2) Comparar os dois primeiros
	# (3) Comparar de novo os dois últimos
	
	if:
	bgt $t3, $t2, first					# Se $t3 > $t2
	bgt $t2, $t1, second				# Se $t2 > $t1
	bgt $t3, $t2, third					# Se $t3 > $t2
	j Resposta
	
	first:
		move $t0, $t2					#	$t0 = $t2
		move $t2, $t3					#	$t2 = $t3
		move $t3, $t0					#	$t3 = $t0
		j if
		
	second:
		move $t0, $t1					#	$t0 = $t1
		move $t1, $t2					#	$t1 = $t2
		move $t2, $t0					#	$t2 = $t0
		j if
	
	third:
		move $t0, $t2					#	$t0 = $t2
		move $t2, $t3					#	$t2 = $t3
		move $t3, $t0					#	$t3 = $t0
		j if
		
	# Imprimindo o resultado
	Resposta:
	# Maior
	li $v0, 4							# Mensagem para o maior número
	la $a0, Maior
	syscall
	
	li $v0, 1							
	move $a0, $t1						# Mover o maior número ($t1) para o registrador padrão $a0
	syscall
	
	# Meio
	li $v0, 4							# Mensagem para o número do meio
	la $a0, Meio
	syscall
	
	li $v0, 1							
	move $a0, $t2						# Mover o número do meio ($t2) para o registrador padrão $a0
	syscall
	
	# Menor
	li $v0, 4							# Mensagem para o número do meio
	la $a0, Menor
	syscall
	
	li $v0, 1							# codigo 1 -> imprimir inteiro
	move $a0, $t3						# Mover o menor número ($t3) para o registrador padrão $a0
	syscall
	
