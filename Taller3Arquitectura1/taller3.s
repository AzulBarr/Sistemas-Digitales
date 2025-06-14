li x1, 0x00
sw x1, 0(x0)

li x1, 0x00
sw x1, 1(x0)

li x1, 0x00
sw x1, 2(x0)

li x1, 0x00
sw x1, 3(x0)

li x1, 0x00
sw x1, 4(x0)

li x1, 0x00
sw x1, 5(x0)

li x1, 0x00
sw x1, 6(x0)

li x1, 0x00
sw x1, 7(x0)

li x1, 0x00
sw x1, 8(x0)

li x1, 0x00
sw x1, 9(x0)

li x1, 0x00
sw x1, 10(x0)

li x1, 0x00
sw x1, 11(x0)
<main>:
    addi x11 x0 4
    lw x12 0(x11)
    addi x13 x0 4
    lw x13 0(x13)
    lw x13 0(x13)
    beq x12 x13 -20 #<main>
    jal x0 8 #<guardar>
    
<fin_programa>:
jal x0 0 #<fin_programa>

<guardar>:
lui x14 0xfffa6
addi x14 x14 -1539
add x12 x14 x12
sw x11 40(x12)
jal x0 -20 #<fin_programa>