module shifter(in, cnt, op, out);
	input [15:0]in;
	input [3:0]cnt;
	input [1:0]op;
	output [15:0]out;
	
    wire [15:0] l_rot, [15:0] l_shift, [15:0] r_arith, [15:0] r_logic;
	wire [15:0] rll_out, [15:0] sll_out, [15:0] rrl_out, [15:0] srl_out;
	
	sll shift_left_logic (.in(in[15:0]), .cnt(cnt[3:0]), .out(sll_out[15:0]));
	srl shift_right_logic (.in(in[15:0]), .cnt(cnt[3:0]), .out(srl_out[15:0]));
	rll rotate_left_logic (.in(in[15:0]), .cnt(cnt[3:0]), .out(rll_out[15:0]));
	rrl rotate_right_arith (.in(in[15:0]), .cnt(cnt[3:0]), .out(rrl_out[15:0]));
	
	mux_4by16 shift_sel (.A(rll_out[15:0]), 
	                     .B(sll_out[15:0]), 
	                     .C(rrl_out[15:0]), 
	                     .D(srl_out[15:0]), 
	                     .sel(op[1:0]), 
	                     .out(out[15:0]));
	
endmodule
