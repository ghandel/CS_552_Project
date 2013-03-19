// test that offset works

jal 10 // jump PC = 12, store PC = 2
Nop // PC = 2
Nop
Nop
Nop
Nop
Nop // PC = 12
jalr r7, 18 // should return to PC = 20
Nop
Nop
Nop // PC = 20
halt
