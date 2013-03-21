module sign_ext (in, op, out);

    input [7:0] in;
    input op;
    
    output [15:0] out;
    
    mux2_1 mux0 (.A(in[0]), .B(in[0]), .s(op), .out(out[0]));
    mux2_1 mux1 (.A(in[1]), .B(in[1]), .s(op), .out(out[1]));
    mux2_1 mux2 (.A(in[2]), .B(in[2]), .s(op), .out(out[2]));
    mux2_1 mux3 (.A(in[3]), .B(in[3]), .s(op), .out(out[3]));
    mux2_1 mux4 (.A(in[4]), .B(in[4]), .s(op), .out(out[4]));
    mux2_1 mux5 (.A(in[4]), .B(in[5]), .s(op), .out(out[5]));
    mux2_1 mux6 (.A(in[4]), .B(in[6]), .s(op), .out(out[6]));
    mux2_1 mux7 (.A(in[4]), .B(in[7]), .s(op), .out(out[7]));
    mux2_1 mux8 (.A(in[4]), .B(in[7]), .s(op), .out(out[8]));
    mux2_1 mux9 (.A(in[4]), .B(in[7]), .s(op), .out(out[9]));
    mux2_1 mux10 (.A(in[4]), .B(in[7]), .s(op), .out(out[10]));
    mux2_1 mux11 (.A(in[4]), .B(in[7]), .s(op), .out(out[11]));
    mux2_1 mux12 (.A(in[4]), .B(in[7]), .s(op), .out(out[12]));
    mux2_1 mux13 (.A(in[4]), .B(in[7]), .s(op), .out(out[13]));
    mux2_1 mux14 (.A(in[4]), .B(in[7]), .s(op), .out(out[14]));
    mux2_1 mux15 (.A(in[4]), .B(in[7]), .s(op), .out(out[15]));
    
endmodule
