main:
    li a0, 4 #li a3, 4
    jal ra, FUNCION
    li a2, 10
    bne a0, a2, noFunciona
funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin:
    j fin
    
    
FUNCION: #sumatoria
#prologo:
#    addi sp, sp, -16
#    sw ra, (0)sp

    mv a1, a0
    mv a0, zero
inicioCiclo:
    beq a1, zero, finCiclo
    add a0, a0, a1
    addi a1, a1, -1
    j inicioCiclo
finCiclo:
#epilogo:
#    lw ra, (0)sp
#    addi sp, sp, 16
    ret