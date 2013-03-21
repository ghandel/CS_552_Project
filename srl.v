module srl (in, cnt, out);

    input [15:0] in;
    input [3:0] cnt;
    
    output [15:0] out;
    
    wire [15:0] first_out;
    wire [15:0] second_out;
    wire [15:0] third_out;
	
    srl_0 shift0 (.in(in[15:0]), .cnt(cnt[0]), .out(first_out[15:0]));
	srl_1 shift1 (.in(first_out[15:0]), .cnt(cnt[1]), .out(second_out[15:0]));
	srl_2 shift2 (.in(second_out[15:0]), .cnt(cnt[2]), .out(third_out[15:0]));
	srl_3 shift3 (.in(third_out[15:0]), .cnt(cnt[3]), .out(out[15:0]));
	
endmodule
