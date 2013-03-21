module sll_1 (in, cnt, out);

	input [15:0] in;
	input cnt;

	output [15:0] out;
	
	mux2_1 sub0 (.A(in[0]), .B(0), .s(cnt), .out(out[0]));
	mux2_1 sub1 (.A(in[1]), .B(0), .s(cnt), .out(out[1]));
	mux2_1 sub2 (.A(in[2]), .B(in[0]), .s(cnt), .out(out[2]));
	mux2_1 sub3 (.A(in[3]), .B(in[1]), .s(cnt), .out(out[3]));
	mux2_1 sub4 (.A(in[4]), .B(in[2]), .s(cnt), .out(out[4]));
	mux2_1 sub5 (.A(in[5]), .B(in[3]), .s(cnt), .out(out[5]));
	mux2_1 sub6 (.A(in[6]), .B(in[4]), .s(cnt), .out(out[6]));
	mux2_1 sub7 (.A(in[7]), .B(in[5]), .s(cnt), .out(out[7]));
	mux2_1 sub8 (.A(in[8]), .B(in[6]), .s(cnt), .out(out[8]));
	mux2_1 sub9 (.A(in[9]), .B(in[7]), .s(cnt), .out(out[9]));
	mux2_1 sub10 (.A(in[10]), .B(in[8]), .s(cnt), .out(out[10]));
	mux2_1 sub11 (.A(in[11]), .B(in[9]), .s(cnt), .out(out[11]));
	mux2_1 sub12 (.A(in[12]), .B(in[10]), .s(cnt), .out(out[12]));
	mux2_1 sub13 (.A(in[13]), .B(in[11]), .s(cnt), .out(out[13]));
	mux2_1 sub14 (.A(in[14]), .B(in[12]), .s(cnt), .out(out[14]));
	mux2_1 sub15 (.A(in[15]), .B(in[13]), .s(cnt), .out(out[15]));
	
endmodule
