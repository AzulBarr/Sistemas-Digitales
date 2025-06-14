main: 
    li a0, 4 #a0=4
    li a1, 6 #a1=6
    jal ra, FUNCION #salta a FUNCION y guarda el PC en ra
    li a2, 10 #a2=10
    bne a0, a2, noFunciona #si a0 distinto de a2, salta a noFunciona
funciona:
    li a1, 1
    j fin
noFunciona: 
    li a1, 0
fin: j fin

FUNCION: 
prólogo:
    addi sp, sp, -4 #Reserva 4 direcciones de memoria para el stack
    sw ra, (0)sp #guarda el PC donde llamaron a la función en el stack
    
    #add a3, a0, a1 #a3 = a0 + a1
    add a0, a0, a1 #a3 = a0 + a1

    
epilogo:    
    lw ra, (0)sp #restaura ra
    addi sp, sp, 4 #restaura sp
    ret #retorna, jalr zero, ra, 0
#La podemos llamar "sumador" porque suma a0 y a1.
#El error fue que el programador A usó a3 como variable de salida pero por contrato estaba estipulado usar a0.