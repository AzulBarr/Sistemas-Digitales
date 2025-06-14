main:     
    li s1, 1 
    mv a0, s1 
    jal ra, FibonacciIterativo 
    bne a0, s1 noFunciona
    
    li s2, 89
    li a0, 11
    jal ra, FibonacciIterativo 
    bne a0, s2 noFunciona
    
funciona: 
    li a1, 1 
    j fin 
noFunciona: 
    li a1, 0 
    
fin: j fin 

FibonacciIterativo:
    li t0 0 #contador
    li t1 0
    li t2 1
for:
    beq a0 t0 epilogo
    add t3 t1 t2
    mv t1 t2
    mv t2 t3
    addi t0 t0 1
    j for

epilogo:
    mv a0 t1
    ret
    
    
    
    

    
    