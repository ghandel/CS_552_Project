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
                //something
            end
            3'b101:
            begin
                //something
            end
            3'b110:
            begin
                //something
            end
            3'b111:
            begin
                //something
            end
        endcase
    end
    
    
    cla_4bit cla_0 (.A(a0), .B(b0), .Cin(Cin), .Cout(out_0));
    cla_4bit cla_1 (.A(a1), .B(b1), .Cin(out_0), .Cout(out_1));
    cla_4bit cla_2 (.A(a2), .B(b2), .Cin(out_1), .Cout(out_2));
    cla_4bit cla_3 (.A(a3), .B(b3), .Cin(out_2), .Cout(Ofl));
    
    
endmodule
