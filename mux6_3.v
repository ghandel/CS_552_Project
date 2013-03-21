module mux6_3 (A, B, sel, out);

    input [2:0] A;
    input [2:0] B;
    input sel;
    
    output [2:0] out;
    
    mux2_1 mux0 (.A(A[0]), .B(B[0]), .s(sel), .out(out[0]));
    mux2_1 mux1 (.A(A[1]), .B(B[1]), .s(sel), .out(out[1]));
    mux2_1 mux2 (.A(A[2]), .B(B[2]), .s(sel), .out(out[2]));
    
endmodule
