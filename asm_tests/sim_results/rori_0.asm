// Sets one new bit for each rori op to test for each number
// of possible set bits (set bit is 1, unset is 0)

lbi r1, 1
rori r2, r1, 1
addi r2, r2, 1
rori r3, r2, 3
addi r3, r3, 1
rori r4, r3, 5
addi r4, r4, 1
rori r5, r4, 1
addi r1, r5, 1
rori r2, r1, 3
addi r2, r2, 1
rori r3, r2, 5
addi r3, r3, 1
rori r4, r3, 1
addi r4, r4, 1
rori r5, r4, 3
addi r1, r5, 1
rori r2, r1, 5
addi r2, r2, 1
rori r3, r2, 1
addi r3, r3, 1
rori r4, r3, 3
addi r4, r4, 1
rori r5, r4, 5
addi r1, r5, 2
rori r2, r1, 1
addi r2, r2, 4
rori r3, r2, 3
addi r3, r3, 1
rori r4, r3, 5
addi r4, r4, 2
rori r5, r4, 1
addi r1, r5, 1
rori r2, r1, 3
halt
