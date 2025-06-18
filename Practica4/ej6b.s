main: 
    li a0, 4 #4
    jal FUNCION
    li a1, 5
    bne a0, a1, noFunciona
    li a0, 5
    jal FUNCION
    li a1, 8
    bne a0, a1, noFunciona
    li a0, 6
    jal FUNCION
    li a1, 13
    bne a0, a1, noFunciona
funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0
fin: 
    j fin


#F(x) = {1 si x=0, 1 si x=1, f(x-1)+f(x-2) cc}
FUNCION: #Suma dos anteriores de la serie
prologo:
    addi sp, sp, -16 #8
    sw a0, (0)sp
    sw ra, (4)sp #no estaba
    
    #li a1, 1
    li t1, 1
    beq a0, zero, casoBase0 
    beq a0, t1, casoBase1
    addi a0, a0, -1
    jal FUNCION

    mv a1, a0
    sw a1 8(sp) #no estaba
    lw a0, (0)sp
    addi a0, a0, -2
    jal FUNCION
    
    lw a1 8(sp) #no estaba
    add a0, a1, a0
    j epilogo
    
casoBase0: 
    li a0, 1
    j epilogo
casoBase1: 
    li a0, 1

epilogo: 
    lw ra, (4)sp
    addi sp, sp, 16 #8
    ret