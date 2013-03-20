module mux4_2 (inA, inB, sel, out);

    input [1:0] inA;
    input [1:0] inB;
    input sel;
    
    output [1:0] out;
    
    mux2_1 mux0 (.InA(inA[0]), .InB(inB[0]), .S(sel), .Out(out[0]));
    mux2_1 mux1 (.InA(inA[1]), .InB(inB[1]), .S(sel), .Out(out[1]));
    
endmodule
