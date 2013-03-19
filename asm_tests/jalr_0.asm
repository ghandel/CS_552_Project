// testing regular return

jal 8 // Should jump to PC = 10, and store PC = 2
Nop // PC = 2
Halt
Nop
Nop
Nop // PC = 10
Nop
jalr r7, 0 // Should jump to PC = 2
Nop
Nop
Halt
