module arith (a, b, op, sign, ofl, out);

    input [15:0] a;
    input [15:0] b;
    input [1:0] op;
    input sign;
    
    output [15:0] out;
    output ofl;
    
    wire [15:0] ApB, [15:0] AoB, [15:0] AxB, [15:0] AnB;
    wire [15:0] nA, [15:0] nB;
    
    and_16bit and16 (.A(A), .B(B), .out(AnB));
    or_16bit  or16  (.A(A), .B(B), .out(AoB));
    xor_16bit xor16 (.A(A), .B(B), .out(AxB));
    cla_16bit cla0 (.a(A[15:0]), 
                    .b(B[15:0]), 
                    .cin(Cin), 
                    .cout(Ofl), 
                    .out(ApB[15:0]));
    
    inverter_16bit inv0 (.in(A), .out(vA));
    inverter_16bit inv1 (.in(B), .out(vB));
    
endmodule
