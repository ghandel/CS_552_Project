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
    
    reg [15:0] AnB, [15:0] AoB, [15:0] AxB;
    reg [15:0] vA, [15:0] vB;
    
    and_16bit and16 (.A(A), .B(B), .out(AnB));
    or_16bit  or16  (.A(A), .B(B), .out(AoB));
    xor_16bit xor16 (.A(A), .B(B), .out(AxB));
    inverter_16bit inv0 (.in(A), .out(vA));
    inverter_16bit inv1 (.in(B), .out(vB));
    
    always @(*)
    begin
        case(Op[2:0])
            3'b000:
            begin
                //something
            end
            3'b001:
            begin
                //something
            end
            3'b010:
            begin
                //something
            end
            3'b011:
            begin
                //something
            end
            3'b100:
            begin
                assign Cin = 1'b0;
                a0 = A[3:0];
                a1 = A[7:4];
                a2 = A[11:8];
                a3 = A[15:12];
                b0 = B[3:0];
                b1 = B[7:4];
                b2 = B[11:8];
                b3 = B[15:12];
            end
            3'b101:
            begin
                
            end
            3'b110:
            begin
                //something
            end
            3'b111:
            begin
                // invA = 1, invB = 1, Cin = 1
            end
        endcase
    end
    
    always @(invA)
    begin
        a0 = vA[3:0];
        a1 = vA[7:4];
        a2 = vA[11:8];
        a3 = vA[15:12];
        assign Cin = 1'b1;
    end
    
    always @(invB)
    begin
        b0 = vB[3:0];
        b1 = vB[7:4];
        b2 = vB[11:8];
        b3 = vB[15:12];
        assign Cin = 1'b1;
    end
    
    cla_4bit cla_0 (.A(a0), .B(b0), .S(Out[3:0]), .Cin(Cin), .Cout(out_0));
    cla_4bit cla_1 (.A(a1), .B(b1), .S(Out[7:4]), .Cin(out_0), .Cout(out_1));
    cla_4bit cla_2 (.A(a2), .B(b2), .S(Out[11:8]), .Cin(out_1), .Cout(out_2));
    cla_4bit cla_3 (.A(a3), .B(b3), .S(Out[15:12]), .Cin(out_2), .Cout(Ofl));
    
    assign Z = ~(s0[0] | s0[1] | s0[2] | s0[3] | s1[0] | s1[1] | s1[2] | s1[3] | s2[0] | s2[1] | s2[2] | s2[3] | s3[0] | s3[1] | s3[2] | s3[3])
    
endmodule
