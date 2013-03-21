module mux4_2 (A, B, sel, out);

    input [1:0] A;
    input [1:0] B;
    input sel;
    
    output [1:0] out;
    
    mux2_1 mux0 (.A(A[0]), .B(B[0]), .s(sel), .out(out[0]));
    mux2_1 mux1 (.A(A[1]), .B(B[1]), .s(sel), .out(out[1]));
    
endmodule
