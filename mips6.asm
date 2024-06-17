.text

#Definições e Inicializações
.globl main

main:
	
	li $t0, 0
	li $t1, 1

#Entrada do Usuário e Exibição da Pergunta
	li $v0,4
	la $a0, question
	syscall

#Leitura do Número do Usuário
	li $v0,5
	syscall

	move $t7,$v0
	move $t6,$v0
	move $t5,$v0
	move $t8,$v0

#Exibição da Resposta Inicial
	li $v0,4
	la $a0,anwser
	syscall

	li $v0,1
	move $a0,$t6
	syscall

	li $v0,4
	la $a0, colon
	syscall

	li $v0,4
	la $a0, newline
	syscall

#Verificação de Casos Especiais
	#bgt $t7,45,error
	beq $t7,0,result
	beq $t7,1,fibonacciof1
	bgt $t7,1,different0

#Casos Especiais
fibonacciof1:

	li $v0,4
	la $a0, para00
	syscall

	li $v0,10
	syscall

#Cálculo da Sequência de Fibonacci
calculate:
	
	ble $t8, 1, different0
	li $v0,4
	la $a0, drawf1
	syscall
	
	li $v0,1
	move $a0,$t8
	syscall
	
	li $v0,4
	la $a0, drawf2
	syscall
	
	li $v0,1
	add $t8, $t8, -1
	move $a0, $t8
	syscall

	li $v0,4
	la $a0, drawf3
	syscall

	li $v0,1
	add $t8, $t8, -1
	move $a0, $t8
	syscall
	
	li $v0,4
	la $a0, drawf4
	syscall
	
	move $t8, $t7
	
#Bloco Different0
different0:

	bne $t7,$zero, fibonacci

	li $v0, 4
	la $a0, para1
	syscall
	
	move $v0,$t0
	
#Exibição do Resultado Final
result:
	
	li $v0,4
	la $a0, anwserfinal1
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0, anwserfinal2
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,4
	la $a0, dot
	syscall
	
	li $v0, 10
	syscall
	
fibonacci:

	addu $t7,$t7,-1
	addu $t2,$t0,$t1
	move $t0,$t1
	move $t1,$t2
	j calculate

.data

question: .asciiz "Digite um numero para calcular a sequencia de fibonnacci, f(x): "
anwser: .asciiz "Calculando a sequencia de fibonnacci de: "
colon: .asciiz ":"
newline: .asciiz "\n"
drawf1: .asciiz "F("
drawf2: .asciiz ") = f("
drawf3: .asciiz ") + f("
drawf4: .asciiz ")\n"
anwserfinal1: .asciiz "F("
anwserfinal2: .asciiz ") is "
dot: .asciiz "."
para0: .asciiz "F(0) = 0\n"
para00: .asciiz "Resultado da operação F(1) = 1.\n"
para1: .asciiz "F(1) = 1\nF(0) = 0\n"
error: .asciiz "ERRO: Numero deve ser <= 45\n\n"