module mux_4by16 (A, B, C, D, sel, out);
    
    input [15:0] A;
    input [15:0] B;
    input [15:0] C;
    input [15:0] D;
    input [1:0] sel;
    
    output [15:0] out;
    
    wire [15:0] m_out0;
    wire [15:0] m_out1;
    
    
    mux32_16 mux0 (.A(A[15:0]), .B(B[15:0]), .sel(sel[0]), .out(m_out0[15:0]));
    mux32_16 mux1 (.A(C[15:0]), .B(D[15:0]), .sel(sel[0]), .out(m_out1[15:0]));
    
    mux32_16 mux2 (.A(m_out0[15:0]), .B(m_out1[15:0]), .sel(sel[1]), .out(out[15:0]));
    
endmodule
