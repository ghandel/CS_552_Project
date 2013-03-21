module reg_16bit (out, in, wr_en, clk, rst);

	output [15:0] out;
	input [15:0] in;
	input wr_en;
	input clk;
	input rst;
	
	dff_en bits[15:0] (.q(out), .d(in), .en(wr_en), .clk(clk), .rst(rst));

endmodule
