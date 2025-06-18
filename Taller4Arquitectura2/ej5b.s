main:
    li a0 3
    li s0 3
    jal fibonacci3
    bne a0 s0 noFunciona
    li a0 4
    li s0 6
    jal fibonacci3
    bne a0 s0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin 


fibonacci3:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)

    beq a0 zero casoBase0

    li t0 1
    beq a0 t0 casoBase1

    li t0 2
    beq a0 t0 casoBase2

    mv s0 a0
    addi a0 s0 -1
    jal fibonacci3 #F(x-1) 

    mv s1 a0 #s1 = F(x-1)
    addi a0 s0 -2
    jal fibonacci3 #F(x-2) 

    add s1 s1 a0 #F(x-1) + #F(x-2)

    addi a0 s0 -3
    jal fibonacci3 #F(x-3) 

    add s1 s1 a0 #F(x-1) + F(x-2) + F(x-3)
    mv a0 s1
    j epilogo
casoBase0:
    li a0 0
    j epilogo
casoBase1:
    li a0 1
    j epilogo
casoBase2:
    li a0 2
epilogo:
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    addi sp sp 16
    ret
