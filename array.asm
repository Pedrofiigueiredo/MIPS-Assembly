# Simulando um vetor do tipo int c[16] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0};

.data
c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0 # WORD para palavras de 32bits (cada)

# 32bits = 4bytes | 4 * 16(número de posições) = 64bytes (o vetor ocupa)

# Cada posição de memória consegue armazenar ***1Byte***. Cada elemento do vetor ocupa 4Bytes, 
# logo CADA POSIÇÂO DO VETOR OCUPA 4 POSIÇÔES DE MEMÒRIA (+4 no deslocamento)

fim: .asciiz "\nFim do Programa"
espaco: .asciiz " "
numero: .asciiz "\n\nDigite um número inteiro: "
linha: .asciiz "\n"

.text
la $s2, c               # Colocando o endereço do array em $s2

addi $t3,$zero,16 	# Quantidade de elementos do vetor ($t3 é um contador)

loop:
lw $t2, 0($s2) 		# Colocando o elemento do indice zero do array em $t2 | $t2 = c[0]
               
li $v0, 1 		# Imprimindo o elemento
move $a0, $t2
syscall

li $v0, 4 		# Imprimindo um espaco de separaçao entre os elementos
la $a0, espaco
syscall

addiu $s2, $s2, 4 	# Cada elemento ocupa 4Bytes, logo o proximo elemento é o endereço do c[0] + 4 bytes
			# $s2 = c[x]. x começa em 4 e é somado em 4 a cada loop

subi $t3,$t3,1 		# Subtrai o contador para controlar qtos elementos ja foram impressos
bne $t3,$zero,loop	# Controle do loop (BNE = Branch if Not Equal)


#EXERCICIO: somar uma constante qualquer a cada um dos elementos do vetor e imprimir o vetor alterado

# (1) Receber um valor do usuário
li $v0, 4		# Código para imprimir string
la $a0, numero
syscall

li $v0, 5		# Còdigo para ler int
syscall

move $t4, $v0		# Move para o registrador temporário $t4 o conteúdo de $v0

la $s2, c               # Colocando o endereço do array em $s2
addi $t7,$zero,16 	# Quantidade de elementos do vetor ($t7 é um contador)

li $v0, 4 		# Imprimindo uma linha
la $a0, linha
syscall

# (2) Somar o valor lido a cada elemento do vetor
la $t8, 0
soma:
lw $t5, 0($s2)		# Carrega o um elemento do vetor (posição 0) para o registrador $t1

add $t6, $t4, $t5	# Coloca em $t2 o valor da soma de $t4 (entrada do usuário) e $t5 (elemento do vetor)

li $v0, 1 		# Imprimindo o elemento
move $a0, $t6
syscall

li $v0, 4 		# Imprimindo um espaco de separaçao entre os elementos
la $a0, espaco
syscall

#sw $t6, 0($s2)		# Salva o valor somado no registrador $s3

addiu $s2, $s2, 4	# Avança para a próxima posição do vetor

sub $t7, $t7, 1		# Coloca em $t3 o valor de $t7 -1
bne $t7, $zero, soma	# Enquanto o valor de $t7 for diferente de zero, volte para soma (linha 59)

# (3) Salvar o vetor modificado

# (4) Imprimir o novo vetor
addi $t3,$zero,16
imprime:
lw $t2, 0($s2) 		# Colocando o elemento do indice zero do array em $t2 | $t2 = c[0]
               
li $v0, 1 		# Imprimindo o elemento
move $a0, $t2
syscall

li $v0, 4 		# Imprimindo um espaco de separaçao entre os elementos
la $a0, espaco
syscall

addiu $s2, $s2, 4 	# Cada elemento ocupa 4Bytes, logo o proximo elemento é o endereço do c[0] + 4 bytes
			# $s2 = c[x]. x começa em 4 e é somado em 4 a cada loop

subi $t3,$t3,1 		# Subtrai o contador para controlar qtos elementos ja foram impressos
bne $t3,$zero,imprime	# Controle do loop (BNE = Branch if Not Equal)


li $v0, 4 		# Imprime a msg de fim do programa
la $a0, fim
syscall
