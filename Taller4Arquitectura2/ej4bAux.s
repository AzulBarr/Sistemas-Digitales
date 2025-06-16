main:
    li a0 2 #caso de test1
    li s0 1
    jal esPotenciaDeDos
    bne a0 s0 noFunciona
    
    li a0 3 #caso de test2
    li s0 0
    jal esPotenciaDeDos
    bne a0 s0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin

esPotenciaDeDos: 
    li t0 1
    li t1 8
for:
    beq t1 zero noEsPotencia
    beq a0 t0 esPotencia
    bgt t0 a0 noEsPotencia
    slli t0 t0 1
    addi t1 t1 -1
    j for
esPotencia:
    li a0 1
    j finEPDD
noEsPotencia:
    li a0 0
finEPDD:
    ret
