.data
arreglo1:
    .word -2, 3

arreglo2:
    .word 1, 2, 0
    
.text
main:
    la a0, arreglo1 #caso de test1
    mv s0, a0
	li a1, 2
	jal invertirArreglo
	lw a0, (0)s0
	lw a1, (4)s0
	li t0, 2
	li t1, -3
	bne a0, t0, noFunciona
	bne a1, t1, noFunciona

    la a0, arreglo2 #caso de test2
    mv s0, a0
	li a1, 3
	jal invertirArreglo
	lw a0, (0)s0
	lw a1, (4)s0
	lw a2, (8)s0
	li t0, -1
	li t1, -2
	li t2, 0
	bne a0, t0, noFunciona
	bne a1, t1, noFunciona
	bne a2, t2, noFunciona
funciona:
	li a1, 1
	j fin
noFunciona:
	li a1, 0
fin:
    j fin
    
invertirArreglo:
prologo:
    addi sp sp -12
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    mv s0 a0
    mv s1 a1
for:
    beq s1 zero epilogo
    lw a0 0(s0)
    jal invertir
    sw a0 0(s0)
    addi s1 s1 -1
    addi s0 s0 4
    j for
epilogo:
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    addi sp sp 12
    ret

invertir:
    sub a0 zero a0
    ret
