# Ejercicio 5.6 del manual de prácticas
# Evaluación de la expresión cuadrática A·X^2 + B·X + C
#
			.data
c1: .asciiz "\nPrograma que realiza la evaluación de la expresión cuadrática A·X^2 + B·X + C"
c2: .asciiz "\nIntroducir el valor de A : "
c3: .asciiz "\nIntroducir el valor de B : "
c4: .asciiz "\nIntroducir el valor de C : "
c5:	.asciiz	"\nIntroducir valor de X: "
c6:	.asciiz "\nValor de A·X^2 + B·X + C = "

# definir el resto de los datos que necesites
A:	.word 0
B:	.word 0
C:	.word 0
X:	.word 0
Re:	.word 0

	.text
	.globl main
main:	# añade aquí las instrucciones de tu programa

# imprimir cadena
	li $v0, 4
	la $a0, c1
	syscall
# imprimir cadena
	li $v0, 4
	la $a0, c2
	syscall
# leer <A>
	li $v0, 5
	syscall
	sw $v0, A
# imprimir cadena
	li $v0, 4
	la $a0, c3
	syscall
# leer <B>
	li $v0, 5
	syscall
	sw $v0, B
# imprimir cadena
	li $v0, 4
	la $a0, c4
	syscall
# leer <C>
	li $v0, 5
	syscall
	sw $v0, C
# imprimir cadena
	li $v0, 4
	la $a0, c5
	syscall
# leer <X>
	li $v0, 5
	syscall
	sw $v0, X($0)
# calculo X^2 X*X
	lw $t0, X($0)
	multu $t0, $t0
	mflo $t1
	sw $t1, Re($0)
# mult con A
	lw $t0, Re($0)
	lw $t1, A($0)

	multu $t0, $t1
	mflo $t1
	sw $t1, Re($0)
# mult con B·X
	lw $t0, X($0)
	lw $t1, B($0)
	lw $t2, Re($0)
	lw $t4, C($0)

	multu $t0, $t1
	mflo $t3
	add $t2, $t2, $t3 # sumo el resultado al resto
	add $t2, $t2, $t4 # sumo C
	sw $t2, Re($0)

# imprimir cadena FINAL
	li $v0, 4
	la $a0, c6
	syscall

# imprimir numero
	li $v0, 1
	lw $a0, Re($0)
	syscall
#fin para VPL
    li $v0, 10
    syscall
