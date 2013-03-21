module mux32_16 (A, B, sel, out);

    input [15:0] A;
    input [15:0] B;
    input sel;
    
    output [15:0] out;
    
    mux16_8 mux0 (.A(A[7:0]), .B(B[7:0]), .sel(sel), .out(out[7:0]));
    mux16_8 mux1 (.A(A[15:8]), .B(B[15:8]), .sel(sel), .out(out[15:8]));
    
endmodule
