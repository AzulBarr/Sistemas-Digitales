main:
    li s1, 2024
    mv a0, s1
    jal ra, FUNCION
    add a0, s1, a0
    bnez a0, noFunciona
funciona: 
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin:
    j fin
    
    
FUNCION: #inverso
#prologo:
#    addi sp, sp, -16
#    sw ra, (0)sp
    
    not a0, a0 #not s1, a0
    addi a0, a0, 1 #addi a0, s1, 1
#epilogo:
#    lw ra, (0)sp
#    addi sp, sp, 16
    ret