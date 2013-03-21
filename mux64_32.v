module mux64_32 (A, B, sel, out);

    input [31:0] A;
    input [31:0] B;
    input sel;
    
    output [31:0] out;
    
    mux32_16 mux0 (.A(A[15:0]), .B(B[15:0]), .sel(sel), .out(out[15:0]));
    mux32_16 mux1 (.A(A[31:16]), .B(B[31:16]), .sel(sel), .out(out[31:16]));
    
endmodule
