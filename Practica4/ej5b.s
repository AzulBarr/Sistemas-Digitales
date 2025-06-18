.data
arreglo:
    .byte 8, 31, 0, 128

.text
main1:
    li a0 3
    jal esPotenciaDeDos 
    li s0 0
    bne s0 a0 noFunciona
   
main2:
    la a0 arreglo
    li a1 4
    jal potenciasEnArreglo
    li s0 3
    bne s0 a0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin
    
    
esPotenciaDeDos:
    li t0 1
    beq a0 t0 noEsPotencia #Si es 1 no es potencia
    
    li t0 8 
    li t2 0 #contador de bit 1
    li t3 2 #limite
for1:
    beqz t0 esPotencia
    
    andi t1 a0 1
    add t2 t2 t1
    
    bge t2 t3 noEsPotencia
    
    addi t0 t0 -1
    srai a0 a0 1
    j for1

noEsPotencia:
    li a0 0
    j salir
esPotencia:
    li a0 1
salir:
    ret 
   
    
potenciasEnArreglo:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw s0 4(sp) #contador
    sw s1 8(sp) #puntero
    sw s2 12(sp) #tama?o
    
    li s0 0
    mv s1 a0
    mv s2 a1
for2:
    beqz s2 epilogo
    
    lbu a0 0(s1)
    jal esPotenciaDeDos
    add s0 s0 a0
    
    addi s1 s1 1
    addi s2 s2 -1
    j for2

epilogo:
    mv a0 s0
    lw s2 12(sp)
    lw s1 8(sp)
    lw s0 4(sp)
    lw ra 0(sp)
    addi sp sp 16
    ret