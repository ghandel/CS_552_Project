module sra (in, cnt, out);

    input [15:0] in;
    input [3:0] cnt;
    
    output [15:0] out;
    
    wire [15:0] first_out, [15:0] second_out, [15:0] third_out;
	
    sra_0 shift0 (.In(in[15:0]), .Cnt(cnt[0]), .Out(first_out[15:0]));
	sra_1 shift1 (.In(first_out[15:0]), .Cnt(cnt[1]), .Out(second_out[15:0]));
	sra_2 shift2 (.In(second_out[15:0]), .Cnt(cnt[2]), .Out(third_out[15:0]));
	sra_3 shift3 (.In(third_out[15:0]), .Cnt(cnt[3]), .Out(out[15:0]));
	
endmodule
