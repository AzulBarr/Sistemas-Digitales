main:
    la a0 funcion
    li a1 0 #min
    li a2 6 #max
    li s0 3
    jal raiz
    bne s0 a0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin


raiz:
prologo:
    addi sp sp -32
    sw ra 0(sp)
    sw s0 4(sp) #puntero
    sw s1 8(sp) #f(min)
    sw s2 12(sp) #f(max)
    sw s4 16(sp) #medio
    sw s3 20(sp) #f(medio)
    
    mv s0 a0
    mv a0 a1
    jalr s0 
    mv s1 a0 #s1 = f(min)
    
    mv a0 a2
    jalr s0 
    mv s2 a0 #s2 = f(max)
    
    mul t0 s1 s2
    bge t0 zero noHayRaiz
    
    sub s4 a2 a1
    srai s4 s4 1 
    add s4 a1 s4 #s4: punto medio 
    
    mv a0 s4
    jalr s0 
    mv s3 a0 #s3 = f(medio)
    
    beqz s3 devolverRaiz #f(medio)=0 -> raiz=medio
    
    mul t2 s3 s4    
    blt t2 zero primeraMitad
    
    mul t3 s3 s2
    blt t3 zero segundaMitad
    
primeraMitad:
    mv a0 s0 
    mv a2 s4
    jal raiz
    j epilogo
    
segundaMitad:
    mv a0 s0 
    mv a1 s4
    jal raiz
    j epilogo

noHayRaiz:
    mv a0 s3
    j epilogo
    
devolverRaiz:
    mv a0 s4
    
epilogo:
    lw ra 0(sp)
    lw s0 4(sp) 
    lw s1 8(sp)
    lw s2 12(sp)
    lw s4 16(sp)
    lw s3 20(sp)
    addi sp sp 32
    ret
    
    
funcion: #f(x) = 3-x
    li t0 3
    li t1 -1
    mul a0 t1 a0
    add a0 a0 t0
    ret