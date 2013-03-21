module mux16_8 (A, B, sel, out);

    input [7:0] A;
    input [7:0] B;
    input sel;
    
    output [7:0] out;
    
    mux8_4 mux0 (.A(A[3:0]), .B(B[3:0]), .sel(sel), .out(out[3:0]));
    mux8_4 mux1 (.A(A[7:4]), .B(B[7:4]), .sel(sel), .out(out[7:4]));
    
endmodule
