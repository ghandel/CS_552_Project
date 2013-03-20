//a 2-1 mux module
module mux2_1(InA, InB, S, Out);
	input InA;
	input InB;
	input S;
	output Out;
	wire S_, A_, B_, AnS, AnS_, BnS, BnS_;
	
	not1 not_1(S, S_);
	not1 not_2(InA, A_);
	not1 not_3(InB, B_);
	nand2 nand_1(A_, S_, AnS);
	not1 not_4(AnS, AnS_);
	nand2 nand_2(B_, S, BnS);
	not1 not_5(BnS, BnS_);
	nor2 nor_1(AnS_, BnS_, Out);
endmodule
