module mux12_3 (A, B, C, D, sel, out);

    input [2:0] A;
    input [2:0] B;
    input [2:0] C;
    input [2:0] D;
    input [1:0] sel;
    
    output [2:0] out;
    
    wire [2:0] out0;
    wire [2:0] out1;
    
    mux6_3 mux0 (.A(A[2:0]), .B(B[2:0]), .sel(sel[0]), .out(out0[2:0]));
    mux6_3 mux1 (.A(C[2:0]), .B(D[2:0]), .sel(sel[0]), .out(out1[2:0]));
    
    mux6_3 mux2 (.A(out0[2:0]), .B(out1[2:0]), .sel(sel[1]), .out(out[2:0]));
    
endmodule
