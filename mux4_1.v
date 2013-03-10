//a 4-1 mux using the 2-1 mux as a submodule
module mux4_1(in, s, out);
	input [3:0] in;
	input [1:0] s;
	output out;
	wire s0, s1;
	
	mux2_1 submux1(in[0], in[1], s[0], S0);
	mux2_1 submux2(in[2], in[3], s[0], S1);
	mux2_1 submux3(s0, s1, s[1], out);
endmodule
