main:     
    li a0 1 
    li a1 1
    li a2 2
    li a3 2
    jal ra, MayorEnR2 
    li s0 -1
    bne a0, s0 noFunciona
         
    li a0 1 
    li a1 1
    li a2 0
    li a3 -3
    jal ra, MayorEnR2 
    li s0 1
    bne a0, s0 noFunciona
    
    li a0 3 
    li a1 1
    li a2 0
    li a3 5
    jal ra, MayorEnR2 
    li s0 0
    bne a0, s0 noFunciona
    
funciona: 
    li a1, 1 
    j fin 
noFunciona: 
    li a1, 0 
    
fin: j fin 

MayorEnR2:
    blt a2 a0 y2<y1
    blt a0 a2 y1<y2
    li a0 0
    j epilogo
    
y2<y1:
    blt a3 a1 fin1
    li a0 0
    j epilogo
fin1:
    li a0 1
    j epilogo
 
y1<y2:
    blt a1 a3 fin2
    li a0 0
    j epilogo
fin2:
    li a0 -1
    j epilogo

epilogo:
    ret