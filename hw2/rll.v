module rll (in, cnt, out);
	
	input [15:0] in;
	input [3:0] cnt;
	
	output [15:0] out;
	
	wire [15:0] first_out, [15:0] second_out, [15:0] third_out;
	
    rll_0 rotate0 (.In(in[15:0]), .Cnt(cnt[0]), .Out(first_out[15:0]));
	rll_1 rotate1 (.In(first_out[15:0]), .Cnt(cnt[1]), .Out(second_out[15:0]));
	rll_2 rotate2 (.In(second_out[15:0]), .Cnt(cnt[2]), .Out(third_out[15:0]));
	rll_3 rotate3 (.In(third_out[15:0]), .Cnt(cnt[3]), .Out(out[15:0]));
	
endmodule
