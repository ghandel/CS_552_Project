module mux128_64 (inA, inB, sel, out);

    input [63:0] inA;
    input [63:0] inB;
    input sel;
    
    output [63:0] out;
    
    mux64_32 mux0 (.inA(inA[31:0]), .inB(inB[31:0]), .sel(sel), .out(out[31:0]));
    mux64_32 mux1 (.inA(inA[63:32]), .inB(inB[63:32]), .sel(sel), .out(out[63:32]));
    
endmodule
