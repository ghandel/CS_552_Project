module mux64_32 (inA, inB, sel, out);

    input [31:0] inA;
    input [31:0] inB;
    input sel;
    
    output [31:0] out;
    
    mux32_16 mux0 (.inA(inA[15:0]), .inB(inB[15:0]), .sel(sel), .out(out[15:0]));
    mux32_16 mux1 (.inA(inA[31:16]), .inB(inB[31:16]), .sel(sel), .out(out[31:16]));
    
endmodule
