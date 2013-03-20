module sign_ext (in, op, out);

    input [7:0] in;
    input op;
    
    output [9:0] out;
    
    mux2_1 mux0 (.InA(in[0]), .InB(in[0]), .S(op), .Out(out[0]));
    mux2_1 mux0 (.InA(in[1]), .InB(in[1]), .S(op), .Out(out[1]));
    mux2_1 mux0 (.InA(in[2]), .InB(in[2]), .S(op), .Out(out[2]));
    mux2_1 mux0 (.InA(in[3]), .InB(in[3]), .S(op), .Out(out[3]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[4]), .S(op), .Out(out[4]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[5]), .S(op), .Out(out[5]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[6]), .S(op), .Out(out[6]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[7]), .S(op), .Out(out[7]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[7]), .S(op), .Out(out[8]));
    mux2_1 mux0 (.InA(in[4]), .InB(in[7]), .S(op), .Out(out[9]));
    
endmodule
