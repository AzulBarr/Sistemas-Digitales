.data
arreglo:
    .word 2, 3, 0, -1 #2 + 3x - x^3

.text
main1:
    li a0 3 #x
    li a1 2 #p
    li a2 1 #c
    jal evaluarMonomio #f(x,c,p) = c x^p
    li s0 9
    bne s0 a0 noFunciona
   
main2:
    la a0 arreglo
    li a1 4 #tama?o
    li a2 3 #x
    jal evaluarPolinomio
    li s0 -16
    bne s0 a0 noFunciona
funciona:
    li a1 1
    j fin
noFunciona:
    li a1 0
fin:
    j fin
    

evaluarMonomio:
    addi sp sp -16
    sw ra 4(sp)
    sw s0 0(sp) #a1
    
    mv s0 a2
    
    jal potencia #a0^a1
    mv a1 s0
    jal multiplicar #a0*a1
    
    lw s0 0(sp)
    lw ra 4(sp)
    addi sp sp 16
    ret
    
    
evaluarPolinomio:
    addi sp sp -32
    sw ra 0(sp)
    sw s0 4(sp) #grado
    sw s1 8(sp) #resultado
    sw s2 12(sp) #puntero
    sw s3 16(sp) #x
    sw s4 20(sp) #contador ciclo
    
    mv s3 a2
    mv s2 a0
    mv s0 a1
    li s1 0
    li s4 0
ciclo:
    beq s4 s0 epilogo
    
    lw a2 0(s2)
    mv a0 s3
    mv a1 s4
    jal evaluarMonomio #a2*a0^a1 
    add s1 s1 a0
    
    addi s2 s2 4
    addi s4 s4 1
    j ciclo
    
epilogo:
    mv a0 s1
    lw s4 20(sp)
    lw s3 16(sp)
    lw s2 12(sp)
    lw s1 8(sp)
    lw s0 4(sp)
    lw ra 0(sp)
    addi sp sp 32
    ret
    
    
multiplicar:
    mv a2, a0
	mv a0, zero
	bge a1, zero, inicioCiclo
	sub a1, zero, a1
	sub a2, zero, a2
inicioCiclo:
	beq a1, zero, retornar
	add a0, a0, a2
	addi a1, a1, -1
	j inicioCiclo
retornar:
	ret


potencia: #a0^a1
    addi sp sp -16
    sw ra 12(sp)
    sw s0 0(sp) #cuenta atras
    sw s1 4(sp) #resultado
    sw s2 8(sp) #a0
    
    mv s2 a0
    mv s0 a1 
    addi s0 s0 -1
    beqz a1 potenciaDeCero
    mv s1 a0 
    
while:
    beqz s0 salir
    
    mv a0 s2
    mv a1 s1
    jal multiplicar
    mv s1 a0
    
    addi s0 s0 -1
    j while

potenciaDeCero:
    li s1 1
salir:
    mv a0 s1
    lw s2 8(sp)
    lw s1 4(sp)
    lw s0 0(sp)
    lw ra 12(sp)
    addi sp sp 16
    ret