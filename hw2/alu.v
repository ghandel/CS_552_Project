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

    wire [15:0] shift_out;
    wire [15:0] arith_out;
    
    shifter shift0 (.In(A[15:0]), 
                    .Cnt(B[3:0]), 
                    .Op(Op[1:0]), 
                    .Out(shift_out[15:0]));
    
    arith arith0 (.a(A[15:0]),
                  .b(B[15:0]),
                  .op(Op[1:0]),
                  .sign(sign),
                  .cin(Cin),
                  .ofl(Ofl),
                  .out(arith_out[15:0]));
    
    mux32_16 op_sel (.inA(shift_out[15:0]), 
                     .inB(arith_out[15:0]), 
                     .sel(Op[2]), 
                     .out(out[15:0]));
    
    or16 zero_check (.a(out[7:0]), .b(out[15:8]), .out(Z));
    
endmodule
