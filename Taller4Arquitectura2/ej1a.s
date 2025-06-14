main: 
    li s1, 2024 #s1 = 2024
    mv a0, s1 #a0 = s1 = 2024 
    jal ra, FUNCION #Salto incondicional a Funcion y guarda PC en ra
    add a0, s1, a0 #Al valor de salida de la función se le suma 2024 !
    bnez a0, noFunciona #Si a0 no es 0, salta a noFunciona
funciona: 
    li a1, 1 #a1 = 1
    j fin #salta a fin
noFunciona: 
    li a1, 0 #a1 = 0
fin: j fin #termina el test
    
FUNCION: 
prologo:
    addi sp, sp, -4 #Reserva 4 direcciones de memoria para el stack
    sw ra, (0)sp #guarda el PC donde llamaron a la función en el stack 
    
    
    #not s1, a0 ##Se guarda la negación de a0, el parámetro de la función, en s1
    #addi a0, s1, 1 #a0 = s1+1 

    not t1, a0
    addi a0, t1, 1
epilogo:    
    lw ra, (0)sp #restaura ra
    addi sp, sp, 4 #restaura sp
    ret #retorna, jalr zero, ra, 0
#La podemos llamar "inverso aditivo" porque es lo que calcula.
#El error fue que el programador A no guardó s1 antes de utilizarlo. 
#Debería de hacerlo ya que es un registro permanate.