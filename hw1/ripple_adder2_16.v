//a ripple carry adder for 2, 16-bit binary numbers
module ripple_adder2_16(A, B, CI, SUM, CO);
	input [15:0]A;
	input [15:0]B;
	input CI;
	output [15:0]SUM;
	output CO;
	wire C1, C2, C3;

	ripple_adder2_4 subadd1(A[3:0], B[3:0], CI, SUM[3:0], C1);
	ripple_adder2_4 subadd2(A[7:4], B[7:4], C1, SUM[7:4], C2);
	ripple_adder2_4 subadd3(A[11:8], B[11:8], C2, SUM[11:8], C3);
	ripple_adder2_4 subadd4(A[15:12], B[15:12], C3, SUM[15:12], CO);
endmodule