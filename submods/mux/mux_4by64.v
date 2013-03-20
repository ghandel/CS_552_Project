module mux_4by64 (inA, inB, inC, inD, sel, out);
    
    input [63:0] inA;
    input [63:0] inB;
    input [63:0] inC;
    input [63:0] inD;
    input [1:0] sel;
    
    output [63:0] out;
    
    wire [63:0] m_out0;
    wire [63:0] m_out1;
    
    
    mux128_64 mux0 (.inA(inA[63:0]), .inB(inB[63:0]), .sel(sel[0]), .out(m_out0[63:0]));
    mux128_64 mux1 (.inA(inC[63:0]), .inB(inD[63:0]), .sel(sel[0]), .out(m_out1[63:0]));
    
    mux128_64 mux2 (.inA(m_out0[63:0]), .inB(m_out1[63:0]), .sel(sel[1]), .out(out[63:0]));
    
endmodule
