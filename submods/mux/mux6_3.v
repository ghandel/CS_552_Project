module mux6_3 (A, B, sel, out);

    input [2:0] A;
    input [2:0] B;
    input sel;
    
    output [2:0] out;
    
    mux2_1 mux0 (.InA(A[0]), .InB(B[0]), .S(sel), .Out(out[0]));
    mux2_1 mux0 (.InA(A[1]), .InB(B[1]), .S(sel), .Out(out[1]));
    mux2_1 mux0 (.InA(A[2]), .InB(B[2]), .S(sel), .Out(out[2]));
    
endmodule
