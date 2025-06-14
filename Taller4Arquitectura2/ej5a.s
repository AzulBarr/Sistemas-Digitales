main:
    
factorial:
    addi sp, sp, −16
    sw a0, 4(sp) #guarda a0
    sw ra, 0(sp) #guarda ra
    addi t0, zero, 1
    bgt a0, t0, else
    addi a0, zero, 1
    addi sp, sp, 16
    jr ra
else: 
    addi a0, a0, −1
    jal factorial
    lw t1, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 16
    mul a0, t1, a0 #mul no se puede usar!!!
    jr ra
