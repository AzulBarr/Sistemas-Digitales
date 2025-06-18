main: 
    li a0, 4
    jal FUNCION
    li a1, 10
    bne a0, a1, noFunciona
funciona: 
    li a1, 1
    j fin
noFunciona: 
    li a1, 0
fin: 
    j fin
    
    
FUNCION: #sumatoria
prologo:
    addi sp, sp, -16
    sw a0, (0)sp
    sw ra, (4)sp
    
    beq a0, zero, casoBase
    addi a0, a0, -1
    jal FUNCION
    lw a1, (0)sp
    add a0, a1, a0
    j epilogo

casoBase: 
    li a0, 0 
epilogo: 
    lw ra, (4)sp
    addi sp, sp, 16
    ret