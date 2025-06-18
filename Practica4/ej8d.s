main:
    li a0 5
    li a1 4
    li s0 12
    jal fibonacci3
    bne a0 s0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin 


fibonacci3:
prologo:
    addi sp sp -16
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    sw a3 12(sp)
    
    mv t0 a1
for:
    beq t0 zero recursion
    addi t0 t0 -1
    
    beq a0 t0 epilogo
    
    j for
    
recursion:
    
    li a3 0
    mv s0 a0
    li s1 0
for2:
    beq a3 a1 afuera
    mv t2 a3
    not t2 t2
 
    add a0 s0 t2
    jal fibonacci3 #F(x-i)
    add s1 s1 a0
       
    addi a3 a3 1
    j for2

afuera:    
    mv a0 s1
    
epilogo:
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    lw a3 12(sp)
    addi sp sp 16
    ret