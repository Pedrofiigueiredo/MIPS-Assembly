# Esse programa recebe um inteiro positivo do usuário e calcula o fatorial desse número

.data
	Input: .asciiz "Digite um inteiro positivo: "
	Result: .asciiz "O fatorial é = "
	End: .asciiz "\n\nFim do programa"

.text
	# Recebe input do usuário
	li $v0, 4						# Cod 4 -> Imprimir stirng
	la $a0, Input
	syscall
	
	li $v0, 5						# Cod 5 -> Receber int
	syscall
	move $t0, $v0					# $t0 -> input do usuário
	
	# Calcula fatorial do número em $t0
	add $t1, $zero, $t0				# $t1 -> Cópia do input do usuário
	
	addi $s0, $zero, 0				# $s0 -> Contador
	addi $s1, $zero, 1				# $s1 -> Incremento
	add $s2, $zero, $t0				# $s2 -> Cálculo do fatorial
	addi $s3, $zero, 1
	
	loop:
		ble $s0, $t0, while
		j end
	
	while:
		add $s0, $s0, $s1			# $s0 += 1 (incremento no contador)
		sub $t1, $t1, $s3			# $t1 -= 1
		beq $t1, $zero, end			# Impedir multiplicação por zero
		mul $s2, $s2, $t1
		j loop						# Continuidade ao laço
	
	end:
		li $v0, 4					# "O fatorial é = "
		la $a0, Result
		syscall
		
		li $v0, 1					# Imprime o resultado
		move $a0, $s2
		syscall
		
		li $v0, 4					# "Fim do programa"
		la $a0, End
		syscall
		
	
	
	
	