//a 2-1 mux module
module mux2_1(in, s, out);
	input [1:0] in;
	input s;
	output out;
	wire S_, AnS_, AnS, BnS, AorB;
	
	not1 not_1(s, S_);
	nand2 nand_1(in[0], S_, AnS);
	not1 not_2(AnS, AnS_);
	nand2 nand_2(in[0], s, BnS);
	nor2 nor_1(AnS, BnS, AorB);
	not1 not_3(AorB, out);
endmodule
