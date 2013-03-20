// test negative jump

jal 14 // Should jump to the target, PC = 16
Nop
Nop
Nop
Nop // PC = 8 Target
halt
Nop
Nop
Nop // PC = 16
jal -12 // Should jump to PC = 8
Nop
Nop
halt
