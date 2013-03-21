module mux128_64 (A, B, sel, out);

    input [63:0] A;
    input [63:0] B;
    input sel;
    
    output [63:0] out;
    
    mux64_32 mux0 (.A(A[31:0]), .B(B[31:0]), .sel(sel), .out(out[31:0]));
    mux64_32 mux1 (.A(A[63:32]), .B(B[63:32]), .sel(sel), .out(out[63:32]));
    
endmodule
