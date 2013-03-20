module mux_8by16bit (inA, inB, inC, inD, inE, inF, inG, inH, sel, out);

    input [15:0] inA;
    input [15:0] inB;
    input [15:0] inC;
    input [15:0] inD;
    input [15:0] inE;
    input [15:0] inF;
    input [15:0] inG;
    input [15:0] inH;
    input [2:0] sel;
    
    output [15:0] out;
    
    wire [15:0] out0;
    wire [15:0] out1;
    wire [15:0] out2;
    wire [15:0] out3;
    wire [15:0] out4;
    wire [15:0] out5;
    
    
    reg_mux16 mux0 (.inA(inA[15:0]), .inB(inB[15:0]), .sel(sel[0]), .out(out0[15:0]));
    reg_mux16 mux1 (.inA(inC[15:0]), .inB(inD[15:0]), .sel(sel[0]), .out(out1[15:0]));
    reg_mux16 mux2 (.inA(inE[15:0]), .inB(inF[15:0]), .sel(sel[0]), .out(out2[15:0]));
    reg_mux16 mux3 (.inA(inG[15:0]), .inB(inH[15:0]), .sel(sel[0]), .out(out3[15:0]));
    
    reg_mux16 mux4 (.inA(out0[15:0]), .inB(out1[15:0]), .sel(sel[1]), .out(out4[15:0]));
    reg_mux16 mux5 (.inA(out2[15:0]), .inB(out3[15:0]), .sel(sel[1]), .out(out5[15:0]));
    
    reg_mux16 mux6 (.inA(out4[15:0]), .inB(out5[15:0]), .sel(sel[2]), .out(out[15:0]));
    
endmodule
