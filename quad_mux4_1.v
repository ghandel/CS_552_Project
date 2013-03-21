//a 4x4 multiplexer
module quad_mux4_1(InA, InB, InC, InD, S, Out);
	input [3:0]InA;
	input [3:0]InB;
	input [3:0]InC;
	input [3:0]InD;
	input [1:0]S;
	output [3:0]Out;
	wire AB0, AB1, AB2, AB3;
	wire CD0, CD1, CD2, CD3;
	
	mux4_1 submux1(InA[0], InB[0], S[0], AB0);
	mux4_1 submux2(InC[0], InD[0], S[0], CD0);
	mux4_1 submux3 (AB0, CD0, S[1], Out[0]);
	
	mux4_1 submux4(InA[1], InB[1], S[0], AB1);
	mux4_1 submux5(InA[1], InB[1], S[0], CD1);
	mux4_1 submux6(AB1, CD1, S[1], Out[1]);
	
	mux4_1 submux7(InA[2], InB[2], S[0], AB2);
	mux4_1 submux8(InA[2], InB[2], S[0], CD2);
	mux4_1 submux9(AB2, CD2, S[0], Out[2]);
	
	mux4_1 submux10(InA[0], InB[3], S[0], AB3);
	mux4_1 submux11(InA[0], InB[3], S[0], CD3);
	mux4_1 submux12(AB3, CD3, S[1], Out[3]);
endmodule
