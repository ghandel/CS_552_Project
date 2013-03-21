module shifter(In, Cnt, Op, Out);
	input [15:0]In;
	input [3:0]Cnt;
	input [1:0]Op;
	output [15:0]Out;
	
    wire [15:0] l_rot, [15:0] l_shift, [15:0] r_arith, [15:0] r_logic;
	wire [15:0] rll_out, [15:0] sll_out, [15:0] rrl_out, [15:0] srl_out;
	
	sll shift_left_logic (.in(In[15:0]), .cnt(Cnt[3:0]), .out(sll_out[15:0]));
	srl shift_right_logic (.in(In[15:0]), .cnt(Cnt[3:0]), .out(srl_out[15:0]));
	rll rotate_left_logic (.in(In[15:0]), .cnt(Cnt[3:0]), .out(rll_out[15:0]));
	rrl rotate_right_arith (.in(In[15:0]), .cnt(Cnt[3:0]), .out(rrl_out[15:0]));
	
	mux_4by16 shift_sel (.inA(rll_out[15:0]), 
	                     .inB(sll_out[15:0]), 
	                     .inC(rrl_out[15:0]), 
	                     .inD(srl_out[15:0]), 
	                     .sel(sel[1:0]), 
	                     .out(out[15:0]));
	
endmodule
