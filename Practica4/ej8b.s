main:
    li a0 6 #6
    jal profundidadCollatz
    li s1 8 #8
    bne a0 s1 noFunciona
    
    li a0 1
    jal profundidadCollatz
    li s1 0
    bne a0 s1 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin
    
    
profundidadCollatz:
    li t0 0
while:
    li t1 1
    beq a0 t1 epilogo
    addi t0 t0 1
    
    andi t2 a0 1 #funcionEsPar
    xori t2 t2 1 #funcionEsPar
    beq t2 t1 esPar
    #Es impar
    li t1 3
    mul a0 a0 t1
    addi a0 a0 1
    j while 
esPar:
    srai a0 a0 1
    j while
    
epilogo:
    mv a0 t0
    ret

     