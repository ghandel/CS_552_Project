module mux8_4 (A, B, sel, out);

    input [3:0] A;
    input [3:0] B;
    input sel;
    
    output [3:0] out;
    
    mux4_2 mux0 (.A(A[1:0]), .B(B[1:0]), .sel(sel), .out(out[1:0]));
    mux4_2 mux1 (.A(A[3:2]), .B(B[3:2]), .sel(sel), .out(out[3:2]));

endmodule
