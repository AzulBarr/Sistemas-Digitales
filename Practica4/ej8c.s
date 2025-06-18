main:
    li a0 6
    li s1 20
    jal fibonacci3
    bne a0 s1 noFunciona
    
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
    sw a0 4(sp)

    beq a0 zero casoBase0
    li t0 1
    beq a0 t0 casoBase1
    li t0 2
    beq a0 t0 casoBase2
    
    addi a0 a0 -1
    jal fibonacci3
    mv a1 a0
    sw a1 8(sp)
    
    lw a0 4(sp)
    addi a0 a0 -2
    jal fibonacci3
    mv a2 a0
    sw a2 12(sp)
    
    lw a0 4(sp)
    addi a0 a0 -3
    jal fibonacci3

    lw a1 8(sp)
    lw a2 12(sp)
    add a0 a0 a1
    add a0 a0 a2
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
    addi sp sp 16
    ret