#si n es la cantidad de alumnos
#va a ocupar (16 + 8)bits* n + 16 bits
#el último .half es cero
# entonces 3n + 2 bytes

.data 
tablaCalificaciones:
    .half 6724
    .byte 8
    .half 3961
    .byte 7
    .half 5925
    .byte 6
    .half 1410
    .byte 9
    .half 7669
    .byte 9
    .half 0 #declaramos el final

.text

main:
    la a0 tablaCalificaciones
    jal ra sumarNotasImpares
    li s0 22
    bne a0 s0 noFunciona
funciona: li a1 1
    j fin
noFunciona: li a1 0
fin:
    j fin
 
    
# llama a la siguiente funcion
# con un argumento, la posición en la que inicia el arreglo
sumarNotasImpares:
    li t1 0 # Acumulador
for:
    lhu t0 (0)a0 #Cargamos el ID
    beq t0 zero fin2 # Si es 0, sabemos que terminamos
    andi t0 t0 1 # Hacemos una mascara para quedarnos con el ultimo bit del ID
    beq t0 zero sigIteracion # Verificamos si es par
esImpar:
    lbu t0 (2)a0 # Cargamos la Nota
    add t1 t1 t0 # Sumamos la Nota al acumulador
sigIteracion:
    addi a0 a0 3 # Pasamos al siguient valor del arreglo
    j for
fin2:
    mv a0 t1 # Devolvemos el valor del acumulador
    ret
