module alu (A, B, cin, op, invA, invB, sign, out, ofl, Z);

    input [15:0] A;
    input [15:0] B;
    input cin;
    input [2:0] op;
    input invA;
    input invB;
    input sign;         //signed (1) or unsigned (0)
    output [15:0] out;
    output ofl;         //overflow
    output Z;           //zero

    wire [15:0] shift_out;
    wire [15:0] arith_out;
    
    shifter shift0 (.in(A[15:0]), 
                    .Cnt(B[3:0]), 
                    .op(op[1:0]), 
                    .out(shift_out[15:0]));
    
    arith arith0 (.A(A[15:0]),
                  .B(B[15:0]),
                  .op(op[1:0]),
                  .sign(sign),
                  .cin(cin),
                  .ofl(ofl),
                  .out(arith_out[15:0]));
    
    mux32_16 op_sel (.inA(shift_out[15:0]), 
                     .inB(arith_out[15:0]), 
                     .sel(op[2]), 
                     .out(out[15:0]));
    
    or16 zero_check (.a(out[7:0]), .b(out[15:8]), .out(Z));
    
endmodule
