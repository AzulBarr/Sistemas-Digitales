main:
    li a0, 7
    li a1, 13
    jal ra, FUNCION
    mv s1, a0
    
    li a0, 7 #no estaba
    li a1, -1
    jal ra, FUNCION
    beq a0, s1, equivalentes #beq a0, a2, equivalentes
diferentes:
    li a1, 0
    j fin
equivalentes:
    li a1, 1
fin:
    j fin
    
    
FUNCION: #a1 mod(a0)
prologo:
    addi sp, sp, -16
    sw s1, (0)sp #sw ra, (0)sp

    mv a2, a1
    bgt a1, zero, inicioCiclo
    sub a2, zero, a1
inicioCiclo:
    blt a2, a0, finCiclo
    sub a2, a2, a0
    j inicioCiclo
finCiclo:
    mv s1, a0
    mv a0, a2
    bgt a1, zero, terminar
    beq a0, zero, terminar
    sub a0, s1, a0 #(-n)%m=m-(n%m)
terminar:
epilogo:
    lw s1, (0)sp #lw ra, (0)sp
    addi sp, sp, 16
    ret