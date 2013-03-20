module reg_mux16 (inA, inB, sel, out);

    input [15:0] inA;
    input [15:0] inB;
    input sel;
    
    output [15:0] out;
    
    mux2_1 mux0 (.InA(inA[0]), .InB(inB[0]), .S(sel), .Out(out[0]));
    mux2_1 mux1 (.InA(inA[1]), .InB(inB[1]), .S(sel), .Out(out[1]));
    mux2_1 mux2 (.InA(inA[2]), .InB(inB[2]), .S(sel), .Out(out[2]));
    mux2_1 mux3 (.InA(inA[3]), .InB(inB[3]), .S(sel), .Out(out[3]));
    mux2_1 mux4 (.InA(inA[4]), .InB(inB[4]), .S(sel), .Out(out[4]));
    mux2_1 mux5 (.InA(inA[5]), .InB(inB[5]), .S(sel), .Out(out[5]));
    mux2_1 mux6 (.InA(inA[6]), .InB(inB[6]), .S(sel), .Out(out[6]));
    mux2_1 mux7 (.InA(inA[7]), .InB(inB[7]), .S(sel), .Out(out[7]));
    mux2_1 mux8 (.InA(inA[8]), .InB(inB[8]), .S(sel), .Out(out[8]));
    mux2_1 mux9 (.InA(inA[9]), .InB(inB[9]), .S(sel), .Out(out[9]));
    mux2_1 mux10 (.InA(inA[10]), .InB(inB[10]), .S(sel), .Out(out[10]));
    mux2_1 mux11 (.InA(inA[11]), .InB(inB[11]), .S(sel), .Out(out[11]));
    mux2_1 mux12 (.InA(inA[12]), .InB(inB[12]), .S(sel), .Out(out[12]));
    mux2_1 mux13 (.InA(inA[13]), .InB(inB[13]), .S(sel), .Out(out[13]));
    mux2_1 mux14 (.InA(inA[14]), .InB(inB[14]), .S(sel), .Out(out[14]));
    mux2_1 mux15 (.InA(inA[15]), .InB(inB[15]), .S(sel), .Out(out[15]));
    
endmodule
    
