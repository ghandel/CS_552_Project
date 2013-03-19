// test irregular return

lbi r4, 20
jal 6 // Jump to PC = 10, store PC = 4
Nop
Nop
Nop // PC = 10
jalr r4, 0 // jump to PC = 20
Nop
Nop
Nop
Nop // PC = 20
Nop
halt
