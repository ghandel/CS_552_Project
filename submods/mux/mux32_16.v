module mux32_16 (inA, inB, sel, out);

    input [15:0] inA;
    input [15:0] inB;
    input sel;
    
    output [15:0] out;
    
    mux16_8 mux0 (.inA(inA[7:0]), .inB(inB[7:0]), .sel(sel), .out(out[7:0]));
    mux16_8 mux1 (.inA(inA[15:8]), .inB(inB[15:8]), .sel(sel), .out(out[15:8]));
    
endmodule
