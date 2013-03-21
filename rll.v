module rll (in, cnt, out);
	
	input [15:0] in;
	input [3:0] cnt;
	
	output [15:0] out;
	
	wire [15:0] first_out;
	wire [15:0] second_out;
	wire [15:0] third_out;
	
    rll_0 rotate0 (.in(in[15:0]), .cnt(cnt[0]), .out(first_out[15:0]));
	rll_1 rotate1 (.in(first_out[15:0]), .cnt(cnt[1]), .out(second_out[15:0]));
	rll_2 rotate2 (.in(second_out[15:0]), .cnt(cnt[2]), .out(third_out[15:0]));
	rll_3 rotate3 (.in(third_out[15:0]), .cnt(cnt[3]), .out(out[15:0]));
	
endmodule
