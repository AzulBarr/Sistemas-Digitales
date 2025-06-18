main:
    li a0, 4
    li a1, 87
    jal ra, FUNCION
    li a2, 87
    bne a0, a2, noFunciona
funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin:
    j fin
    
    
FUNCION: #maximo
#prologo:
#    addi sp, sp, -16
#    sw ra, (0)sp

#    mv a0, a2
    bgt a0, a1, terminar #bgt a0, a5, terminar
    mv a0, a1 #mv a0, a5

terminar:
#epilogo:
#    lw ra, (0)sp
#    addi sp, sp, 16
    ret