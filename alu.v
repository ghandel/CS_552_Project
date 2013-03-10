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
    
    
    
    cla_4bit cla_0 (.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .Cout(out_0));
    cla_4bit cla_1 (.A(A[7:4]), .B(B[7:4]), .Cin(out_0), .Cout(out_1));
    cla_4bit cla_2 (.A(A[11:8]), .B(B[11:8]), .Cin(out_1), .Cout(out_2));
    cla_4bit cla_3 (.A(A[15:12]), .B(B[15:12]), .Cin(out_2), .Cout(Ofl));
    
    
endmodule
