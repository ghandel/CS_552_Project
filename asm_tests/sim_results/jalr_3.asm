// test negative offset

Nop
Nop
jal 10 //jump pc = 16, store pc = 6
Nop
Nop
jal 6 // pc = 10, jump pc = 18
Nop
Nop
jal 10 //pc = 16, jump pc = 28, store pc = 18, overwriting old pc store
Nop //pc = 18
Nop
Nop
Nop
halt
jalr r7, -8 // return to pc = 10
