module decoder_3to8 (out, in);
	output [7:0] out;
	input [2:0] in;

	assign out[0] = ~in[0] & ~in[1] & ~in[2];
	assign out[1] = in[0] & ~in[1] & ~in[2];
	assign out[2] = ~in[0] & in[1] & ~in[2];
	assign out[3] = in[0] & in[1] & ~in[2];
	assign out[4] = ~in[0] & ~in[1] & in[2];
	assign out[5] = in[0] & ~in[1] & in[2];
	assign out[6] = ~in[0] & in[1] & in[2];
	assign out[7] = in[0] & in[1] & in[2];

endmodule
