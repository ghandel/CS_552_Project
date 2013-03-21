//a 1-bit full adder module
module full_adder(A, B, Cin, S, Cout);
	input A;
	input B;
	input Cin;
	output S;
	output Cout;
	wire AxB, AxBnC, AxBnC_, AnB, AnB_, Out_;
	
	xor2 submod1(A, B, AxB);
	xor2 submod2(AxB, Cin, S);
	nand2 submod3(AxB, Cin, AxBnC);
	not1 submod4(AxBnC, AxBnC_);
	nand2 submod5(A, B, AnB);
	not1 submod6(AnB, AnB_);
	nor2 submod7(AxBnC_, AnB_, Out_);
	not1 submod8(Out_, Cout);
endmodule