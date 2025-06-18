main: 
    li a0, 4
    li a1, 87
    li a2, -124
    li a3, -14
    jal ra, FUNCION
    li a2, -124
    bne a0, a2, noFunciona
funciona: 
    li a1, 1
    j fin
noFunciona: 
    li a1, 0
fin: j fin

FUNCION: #Minimode4
prologo1:
    addi sp, sp, -16
    sw a2, (0)sp
    sw a3, (4)sp
    sw ra, (8)sp
    
    jal ra, FUNCION_AUX #a0=min{a0,a1}=min1
    mv t1, a0 #s1=a0
    
    lw a0, (0)sp #a0=a2
    lw a1, (4)sp #a1=a3
    jal ra, FUNCION_AUX #a0=min{a0,a1}=min{a2,a3}=min2
    mv a1, t1 #a1=min1
    
    jal ra, FUNCION_AUX #a0=min{a0,a1}=min{min2,min1}=min3
    
epilogo:
    lw ra, (8)sp
    addi sp, sp, 16
    ret
    
FUNCION_AUX: #Minimode2
prologo2:
    addi sp, sp, -16
    sw ra, (0)sp
#devuelve el menor
    bgt a1, a0, terminar
    mv a0, a1
terminar: #epilogo
#nosotras corregimos al restaurar todo en el epilogo
epilogo2:
    lw ra (0)sp
    addi sp, sp, 16
    
    ret #el ret ya estaba

# Error: B
