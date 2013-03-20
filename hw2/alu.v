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
                       .inE(ApB[15:0]), 
                       .inF(AoB[15:0]), 
                       .inG(AxB[15:0]), 
                       .inH(AnB[15:0]), 
                       .sel(Op[2:0]), 
                       .out(Out[15:0]));
    
    cla_4bit cla_0 (.A(A[3:0]), 
                    .B(B[3:0]), 
                    .S(ApB[3:0]), 
                    .Cin(Cin), 
                    .Cout(out_0));
                    
    cla_4bit cla_1 (.A(A[7:4]), 
                    .B(B[7:4]), 
                    .S(ApB[7:4]), 
                    .Cin(out_0), 
                    .Cout(out_1));
                    
    cla_4bit cla_2 (.A(A[11:8]), 
                    .B(B[11:8]), 
                    .S(ApB[11:8]), 
                    .Cin(out_1), 
                    .Cout(out_2));
                    
    cla_4bit cla_3 (.A(A[15:12]), 
                    .B(B[15:12]), 
                    .S(ApB[15:12]), 
                    .Cin(out_2), 
                    .Cout(Ofl));
    
    or16 zero_check (.a(ApB[7:0]), .b(ApB[15:8]), .out(Z));
    
endmodule
