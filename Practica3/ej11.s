.data
arreglo:
    .word 3, 1, 4, 1, 5, 9, 2, 6

.text

main:
    la t0 arreglo #puntero a arreglo
    li t1 8 #tamaño
    
#funcion
    lw t2 0(t0) #max
for:
    beq t1 zero fin 
    lw t3 0(t0) #actual
    bge t3 t2 actualizarMax
finFor:
    addi t1 t1 -1
    addi t0 t0 4
    j for
fin:
    j fin #salida t2, deberia ser 9
actualizarMax:
    mv t2 t3
    j finFor