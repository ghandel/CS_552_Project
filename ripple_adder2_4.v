//a ripple carry adder for 2, 4-bit binary numbers
module ripple_adder2_4(A, B, CI, SUM, CO);
	input [3:0]A;
	input [3:0]B;
	input CI;
	output [3:0]SUM;
	output CO;
	wire C1, C2, C3;

	full_adder subadd1(A[0], B[0], CI, SUM[0], C1);
	full_adder subadd2(A[1], B[1], C1, SUM[1], C2);
	full_adder subadd3(A[2], B[2], C2, SUM[2], C3);
	full_adder subadd4(A[3], B[3], C3, SUM[3], CO);
endmodule
