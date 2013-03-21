module arith (A, B, op, sign, cin, ofl, out);

    input [15:0] A;
    input [15:0] B;
    input [1:0] op;
    input sign;
    input cin;
    
    output [15:0] out;
    output ofl;
    
    wire [15:0] ApB;
    wire [15:0] AsB;
    wire [15:0] AxB;
    wire [15:0] AnB;
    wire [15:0] nA;
    wire [15:0] nB;
    wire cout_a, cout_s;
    
    assign sub = ~op[1] & op[0];
    assign ofl = (A[15] & B[15] & AsB[15] & cout_s) | (A[15] & B[15] & ApB[15] & cout_a);
    
    and_16bit and16 (.A(A[15:0]), .B(nB[15:0]), .out(AnB[15:0]));
    xor_16bit xor16 (.A(A[15:0]), .B(B[15:0]), .out(AxB[15:0]));
    
    inverter_16bit inv0 (.in(A[15:0]), .out(nA[15:0]));
    inverter_16bit inv1 (.in(B[15:0]), .out(nB[15:0]));
    
    cla_16bit cla0 (.a(A[15:0]), 
                    .b(B[15:0]), 
                    .cin(cin), 
                    .cout(cout_a), 
                    .out(ApB[15:0]));
    
    cla_16bit cla1 (.a(A[15:0]), 
                    .b(nB[15:0]), 
                    .cin(sub), 
                    .cout(cout_s), 
                    .out(AsB[15:0]));    
    
    mux_4by16 select (.inA(ApB[15:0]), 
                      .inB(AsB[15:0]), 
                      .inC(AxB[15:0]), 
                      .inD(AnB[15:0]), 
                      .sel(op[1:0]), 
                      .out(out[15:0]));
    
endmodule
