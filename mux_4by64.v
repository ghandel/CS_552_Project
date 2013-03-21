module mux_4by64 (A, B, C, D, sel, out);
    
    input [63:0] A;
    input [63:0] B;
    input [63:0] C;
    input [63:0] D;
    input [1:0] sel;
    
    output [63:0] out;
    
    wire [63:0] m_out0;
    wire [63:0] m_out1;
    
    
    mux128_64 mux0 (.A(A[63:0]), .B(B[63:0]), .sel(sel[0]), .out(m_out0[63:0]));
    mux128_64 mux1 (.A(C[63:0]), .B(D[63:0]), .sel(sel[0]), .out(m_out1[63:0]));
    
    mux128_64 mux2 (.A(m_out0[63:0]), .B(m_out1[63:0]), .sel(sel[1]), .out(out[63:0]));
    
endmodule
