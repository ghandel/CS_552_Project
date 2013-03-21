module mux_8by16bit (A, B, C, D, E, F, G, H, sel, out);

    input [15:0] A;
    input [15:0] B;
    input [15:0] C;
    input [15:0] D;
    input [15:0] E;
    input [15:0] F;
    input [15:0] G;
    input [15:0] H;
    input [2:0] sel;
    
    output [15:0] out;
    
    wire [15:0] out0;
    wire [15:0] out1;
    wire [15:0] out2;
    wire [15:0] out3;
    wire [15:0] out4;
    wire [15:0] out5;
    
    
    reg_mux16 mux0 (.A(A[15:0]), .B(B[15:0]), .sel(sel[0]), .out(out0[15:0]));
    reg_mux16 mux1 (.A(C[15:0]), .B(D[15:0]), .sel(sel[0]), .out(out1[15:0]));
    reg_mux16 mux2 (.A(E[15:0]), .B(F[15:0]), .sel(sel[0]), .out(out2[15:0]));
    reg_mux16 mux3 (.A(G[15:0]), .B(H[15:0]), .sel(sel[0]), .out(out3[15:0]));
    
    reg_mux16 mux4 (.A(out0[15:0]), .B(out1[15:0]), .sel(sel[1]), .out(out4[15:0]));
    reg_mux16 mux5 (.A(out2[15:0]), .B(out3[15:0]), .sel(sel[1]), .out(out5[15:0]));
    
    reg_mux16 mux6 (.A(out4[15:0]), .B(out5[15:0]), .sel(sel[2]), .out(out[15:0]));
    
endmodule
