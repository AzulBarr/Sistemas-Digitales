main:
    li a0, 1
    li a1, 2
    jal ra, FUNCION
    li a3, 3
    li a1, 2 #no estaba
    bne a0, a3, noFunciona #(4*1-2/2) != 3
    
    li a0, 3
    li a1, 2 #no estaba
    jal ra, FUNCION
    li a3, 11
    bne a0, a3, noFunciona #(4*3-2/2) != 11
    
    li a0, 3 #no estaba
    li a1, 12
    jal ra, FUNCION
    li a3, 6
    bne a0, a3, noFunciona #(4*3-12/2) != 6
    
funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin:
    j fin
    
    
FUNCION: #calculo combinado
#prologo:
#    addi sp, sp, -16
#    sw ra, (0)sp

    slli a2, a0, 2 #a2 = 4*a0
    srai a1, a1, 1 #a1 = a1/2
    sub a0, a2, a1 #a0 = a2-a1 = 4*a0 - a1/2
#epilogo:
#    lw ra, (0)sp
#    addi sp, sp, 16
    ret