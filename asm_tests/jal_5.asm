//test if the jump and link instruction will have correct value in r7 and pc

jal .Label
lbi r4, -12	//skips instruction

.Label:
lbi r4, 7
halt
// should be r4 = 7
// and r7 = address of "lbi r4, -12"
