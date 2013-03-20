module mux8_4 (inA, inB, sel, out);

    input [3:0] inA;
    input [3:0] inB;
    input sel;
    
    output [3:0] out;
    
    mux4_2 mux0 (.inA(inA[1:0]), .inB(inB[1:0]), .sel(sel), .out(out[1:0]));
    mux4_2 mux1 (.inA(inA[3:2]), .inB(inB[3:2]), .sel(sel), .out(out[3:2]));

endmodule
