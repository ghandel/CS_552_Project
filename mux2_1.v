//a 2-1 mux module
module mux2_1(A, B, s, out);
	input A;
	input B;
	input s;
	output out;
	wire s_not_out, A_not_out, B_not_out, AnS, AnS_not_out, BnS, BnS_not_out;

	not1 not_1   (.in1(s), .out(s_not_out));
	not1 not_2   (.in1(A), .out(A_not_out));
	not1 not_3   (.in1(B), .out(B_not_out));
	nand2 nand_1 (.in1(A_not_out), .in2(s_not_out), .out(AnS));
	not1 not_4   (.in1(AnS), .out(AnS_not_out));
	nand2 nand_2 (.in1(B_not_out), .in2(s), .out(BnS));
	not1 not_5   (.in1(BnS), .out(BnS_not_out));
	nor2 nor_1   (.in1(AnS_not_out), .in2(BnS_not_out), .out(out));
   
endmodule
