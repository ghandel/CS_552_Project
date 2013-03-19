module alu (A, B, Cin, Op, invA, invB, sign, Out, Ofl, Z);

    input [15:0] A;
    input [15:0] B;
    input Cin;
    input [2:0] Op;
    input invA;
    input invB;
    input sign;         //signed (1) or unsigned (0)
    output [15:0] Out;
    output Ofl;         //overflow
    output Z;           //zero

    wire out_0, out_1, out_2;
    reg [3:0] a0, [3:0] a1, [3:0] a2, [3:0] a3;
    reg [3:0] b0, [3:0] b1, [3:0] b2, [3:0] b3;
    reg [3:0] s0, [3:0] s1, [3:0] s2, [3:0] s3;
    
    wire [15:0] rll, [15:0] sll, [15:0] sra, [15:0] srl;
    wire [15:0] ApB, [15:0] AoB, [15:0] AxB, [15:0] AnB;
    wire [15:0] nA, [15:0] nB;
    
    and_16bit and16 (.A(A), .B(B), .out(AnB));
    or_16bit  or16  (.A(A), .B(B), .out(AoB));
    xor_16bit xor16 (.A(A), .B(B), .out(AxB));
    inverter_16bit inv0 (.in(A), .out(vA));
    inverter_16bit inv1 (.in(B), .out(vB));
    
    mux_8by16bit mux0 (.inA(rll[15:0]), 
                       .inB(sll[15:0]), 
                       .inC(sra[15:0]), 
                       .inD(srl[15:0]), 
                       .inE(AnB[15:0]), 
                       .inF(AoB[15:0]), 
                       .inG(AxB[15:0]), 
                       .inH(AnB[15:0]), 
                       .sel(Op[2:0]), 
                       .out(out[15:0]));
    
    cla_4bit cla_0 (.A(a0), 
                    .B(b0), 
                    .S(Out[3:0]), 
                    .Cin(Cin), 
                    .Cout(out_0));
                    
    cla_4bit cla_1 (.A(a1), 
                    .B(b1), 
                    .S(Out[7:4]), 
                    .Cin(out_0), 
                    .Cout(out_1));
                    
    cla_4bit cla_2 (.A(a2), 
                    .B(b2), 
                    .S(Out[11:8]), 
                    .Cin(out_1), 
                    .Cout(out_2));
                    
    cla_4bit cla_3 (.A(a3), 
                    .B(b3), 
                    .S(Out[15:12]), 
                    .Cin(out_2), 
                    .Cout(Ofl));
    
    assign Z = ~(s0[0] | s0[1] | s0[2] | s0[3] | s1[0] | s1[1] | s1[2] | s1[3] | s2[0] | s2[1] | s2[2] | s2[3] | s3[0] | s3[1] | s3[2] | s3[3])
    
endmodule
