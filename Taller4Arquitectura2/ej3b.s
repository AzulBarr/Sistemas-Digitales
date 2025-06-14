main: 
    li a0, 3
    li a1, 10
    li a2, -5
    li a3, 2
    li a4, 5
    li a5, -1
    jal ra, FUNCION #si  a0 <= a4 <= a1 y a2 <= a5 <= a3 -> a0=1
    li a2, 1
    bne a0, a2, noFunciona
funciona: 
li a1, 1
j fin
noFunciona: 
li a1, 0
fin: j fin

FUNCION: 
prologo:
    addi sp, sp, -12
    sw a2, (0)sp
    sw s0, (4)sp
    sw ra, (8)sp
    
    li s0, 1
    mv a2, a4
    jal ra, FUNCION_AUX #a0 <= a2=a4 <= a1 -> a0 <= a4 <= a1 -> a0=1
    bne a0, s0, return #si no, retorna
    lw a0, (0)sp #a0=a2
    mv a1, a3
    mv a2, a5
    jal ra, FUNCION_AUX #a0=a2 <= a2=a5 <= a1=a3 -> a2 <= a5 <= a3 -> a0=1
    bne a0, s0, return # si no, retorna #no hace falta

return: #epilogo
    lw s0, (4)sp
    lw ra, (8)sp
    addi sp, sp, 12
    ret #si  a0 <= a4 <= a1 y a2 <= a5 <= a3 -> a0=1

FUNCION_AUX: #a0 <= a2 <= a1 -> a0=1
prologo_Aux:
    addi sp, sp, -4
    sw ra, (0)sp
    
    sub t0, a2, a0
    blt t0, zero, afuera #a0>a2 -> afuera 
    sub t1, a2, a1
    bgt t1, zero, afuera #a1<a2 -> afuera
adentro: 
    li a0, 1 #a0 <= a2 <= a1
    j terminar
afuera: 
    li a0, 0 #si a2<a1 o a2>a0
terminar: 
    lw ra, (0)sp
    addi sp, sp, 4
    ret
