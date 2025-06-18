.data
arreglo:
    .word 134, 34231, 0, -22
arregloTest:
    .word -134, -34231, 0, 22

.text
main1:
    li a0 3
    jal invertir 
    li s0 -3
    bne s0 a0 noFunciona
    
main2:
    la a0 arreglo
    li a1 4
    jal invertirArreglo
    
    la a0 arreglo
    la a1 arregloTest
    li a2 4
    jal chequearArreglo
    bnez a0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin


invertir:
    xori a0 a0 -1
    addi a0 a0 1
    ret
    
    
invertirArreglo:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw s0 4(sp)  
    
    mv s0 a0
for1:
    beqz a1 epilogo
    
    lw a0 0(s0)
    jal invertir
    sw a0 0(s0)
    
    addi a1 a1 -1
    addi s0 s0 4
    j for1
    
epilogo:
    lw s0 4(sp) 
    lw ra 0(sp)
    addi sp sp 16
    ret
    
    
chequearArreglo:
for2:
    beqz a2 noError
    
    lw t0 0(a0)
    lw t1 0(a1)
    bne t0 t1 error
    
    addi a2 a2 -1
    addi a0 a0 4
    addi a1 a1 4
    j for2

noError:
    li a0 0
    j salir
error:
    li a0 1
salir:
    ret

    