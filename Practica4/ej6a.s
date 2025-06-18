main:
    li a0, 13 #a0 = 13
    li a1, 5 #a1 = 5
    jal FUNCION
    li a1, 3 # 13 mod(5) = 3
    bne a0, a1, noFunciona 
funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin:
    j fin


#Dados a0 y a1 devuelve a0, el resto de la divisi?n de a0 con a1.  
#Como es recursiva, hay que guardar ra
FUNCION: #resto
prologo:
    addi sp sp -16
    sw ra 0(sp)
    
    blt a0, a1, terminar #si a0 < a1, ya es el resto
    #sub a2, a0, a1 #se restan
    sub a0, a0, a1
    jal FUNCION
    
terminar: #epilogo
    lw ra 0(sp)
    addi sp sp 16
    ret