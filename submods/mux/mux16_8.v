module mux16_8 (inA, inB, sel, out);

    input [7:0] inA;
    input [7:0] inB;
    input sel;
    
    output [7:0] out;
    
    mux8_4 mux0 (.inA(inA[3:0]), .inB(inB[3:0]), .sel(sel), .out(out[3:0]));
    mux8_4 mux1 (.inA(inA[7:4]), .inB(inB[7:4]), .sel(sel), .out(out[7:4]));
    
endmodule
