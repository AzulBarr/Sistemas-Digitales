main: 
    li a0, 1 #a0 = 1
    li a1, 2 #a1 = 2
    jal ra, FUNCION #Salto incondicional a Funcion y guarda PC en ra
    li a3, 3 #a3 = 3
    bne a0, a3, noFunciona # (4*1 - 2/2) != 3 # Si son distintos va a noFunciona
    li a0, 3 #a0 = 3
    jal ra, FUNCION #Salto incondicional a Funcion y guarda PC en ra
    li a3, 11 #a3 = 11
    bne a0, a3, noFunciona # (4*3 - 2/2) != 11 # Si son distintos va a noFunciona
    li a1, 12 #a1 = 12
    jal ra, FUNCION #Salto incondicional a Funcion y guarda PC en ra
    li a3, 6 #a3 = 6
    bne a0, a3, noFunciona # (4*3 - 12/2) != 6 # Si son distintos va a noFunciona

funciona:
    li a1, 1
    j fin

noFunciona:
    li a1, 0

fin: j fin

FUNCION: #(4*a0 - a1/2)
prólogo:
    addi sp, sp, -4
    sw ra, (0)sp
    
    slli a2, a0, 2 #multipla por 4 a a0 y lo guarda en a2
    srai a1, a1, 1 #divide por 2 a a1 y lo guarda en a1
    sub a0, a2, a1 #a0 = a2 - a1
epílogo:
    lw ra, (0)sp
    addi sp, sp, 4
    ret

#La podemos llamar "cálculo_combinado".
#El error fue que el programador B no tomó en cuenta que el a0 cambia. Debería usar s1 para testear.