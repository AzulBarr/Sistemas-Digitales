#Arreglo
.data
arreglo1: 
    .byte 1, 2, 3, 4
    
arreglo2: 
    .byte 7, 128, 0
    
.text
main:
    la a0 arreglo1 #caso de test1
    li a1 4
    li s0 3
    jal potenciaEnArreglo
    bne a0 s0 noFunciona
    
    la a0 arreglo2 #caso de test2
    li a1 3
    li s0 1
    jal potenciaEnArreglo
    bne a0 s0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin
     
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
    beq s1 zero epilogo
    lbu a0 0(s0)
    jal esPotenciaDeDos
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
    ret
    
esPotenciaDeDos: 
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
