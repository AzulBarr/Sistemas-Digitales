main:
    li a0 0
    li s1 1
    jal factorial
    bne a0 s1 noFunciona
    
    li a0 3
    li s1 6
    jal factorial
    bne a0 s1 noFunciona

funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin


factorial:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw a0 4(sp)
    
    beq a0 zero casoBase
    addi a0 a0 -1
    jal factorial
    lw t0 4(sp)
    mul a0 t0 a0 
    j epilogo
    
casoBase:
    li a0 1
    
epilogo: 
    lw ra 0(sp)
    addi sp sp 16
    ret