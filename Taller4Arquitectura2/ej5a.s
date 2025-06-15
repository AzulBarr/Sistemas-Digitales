main:
    li a0 3
    li s0 6
    jal factorial
    bne a0 s0 noFunciona
    li a0 4
    li s0 24
    jal factorial
    bne a0 s0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a0 0
fin:
    j fin
    
factorial:
prologo:
    addi sp sp -8
    sw a0 4(sp) 
    sw ra 0(sp) 

    addi t0, zero, 1
    bgt a0, t0, else
    addi a0, zero, 1

    addi sp sp 8
    ret
    
else: 
    addi a0 a0 -1
    jal factorial
    lw a1, 4(sp)
    jal multiplicar

    lw ra, 0(sp)
    addi sp, sp, 8
    ret
    
multiplicar:
    mv a2, a0
	mv a0, zero
	bge a1, zero, inicioCiclo
	sub a1, zero, a1
	sub a2, zero, a2
inicioCiclo:
	beq a1, zero, retornar
	add a0, a0, a2
	addi a1, a1, -1
	j inicioCiclo
retornar:
	ret