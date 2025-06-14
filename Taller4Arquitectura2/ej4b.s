#8bits 
main:
    li a0 2
    jal esPotenciaDeDos
fin1:
    j fin1

esPotenciaDeDos: #tira de 0s con un 1, no en la primera posición
    li t0 1
    li t1 8
for:
    beq t1 zero noEsPotencia
    beq a0 t0 esPotencia
    bgt t0 a0 noEsPotencia
    slli t0 t0 1
    addi t1 t1 -1
    j for
esPotencia:
    li a0 1
    j finEPDD
noEsPotencia:
    li a0 0
finEPDD:
    ret

#potenciasEnArreglo Arreglos de números de 1 byte, 8 bits
.data
arreglo: 
    .byte 128
    .byte 3
    .byte 4
    .byte 6
    .byte 54
.text
main2:
    la a0 arreglo
    li a1 5
    jal potenciaEnArreglo
fin2:
    j fin2
    
#va a llamar a una función y tiene 2 argumentos 
potenciaEnArreglo:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    sw s2 12(sp)
    mv s0 a0
    mv s1 a1
    li s2 0
for2:
    beq s1 zero prologo
    lbu a0 0(s0)
    jal ra esPotenciaDeDos
    add s2 s2 a0
    addi s1 s1 -1
    addi s0 s0 1
    j for2
epilogo:
    mv a0 s2
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    lw s2 12(sp)
    addi sp sp 16