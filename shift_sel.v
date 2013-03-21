module shift_sel (A, B, C, D, sel, out);

    input [15:0] A;
    input [15:0] B;
    input [15:0] C;
    input [15:0] D;
    input [1:0] sel;
    
    output [15:0] out;
    
    mux_4by16 mux0 (.A(A[15:0]), .B(B[15:0]), .C(C[15:0]), .D(D[15:0]), .sel(sel[1:0]), .out(out[15:0]));
    
endmodule
