//a 2-1 mux module
module mux2_1(A, B, s, out);
	input A;
	input B;
	input s;
	output out;
	wire s_, A_, B_, AnS, AnS_, BnS, BnS_;
	
	not1 not_1(s, s_);
	not1 not_2(A, A_);
	not1 not_3(B, B_);
	nand2 nand_1(A_, s_, AnS);
	not1 not_4(AnS, AnS_);
	nand2 nand_2(B_, s, BnS);
	not1 not_5(BnS, BnS_);
	nor2 nor_1(AnS_, BnS_, out);
endmodule
