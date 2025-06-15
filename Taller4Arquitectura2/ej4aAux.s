main:
	li a0, 2
	jal invertir
	li a1, -2
	bne a0, a1, noFunciona
	li a0, -3
	jal invertir
	li a1, 3
	bne a0, a1, noFunciona
funciona:
	li a1, 1
	j fin
noFunciona:
	li a1, 0
fin:
	j fin    

invertir:
    sub a0 zero a0
    ret