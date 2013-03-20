module cla_4bit (A, B, S, Cin, Cout);

    input [3:0] A;
    input [3:0] B;
    input Cin;

    output [3:0] S;
    output Cout;

    wire C1, C2, C3;
    wire P0, P1, P2, P3;
    wire G0, G1, G2, G3;

    assign P0 = A[0] ^ B[0];
    assign P1 = A[1] ^ B[1];
    assign P2 = A[2] ^ B[2];
    assign P3 = A[3] ^ B[3];

    assign G0 = A[0] & B[0];
    assign G1 = A[1] & B[1];
    assign G2 = A[2] & B[2];
    assign G3 = A[3] & B[3];

    assign C1 = G0 | (Cin & P0);
    assign C2 = G1 | (G0 & P1) | (Cin & P0 & P1);
    assign C3 = G2 | (G1 & P2) | (G0 & P1 & P2) | (Cin & P0 & P1 & P2);
    assign Cout = G3 | (G2 & P3) | (G1 & P2 & P3) | (G0 & P1 & P2 & P3) | (Cin & P0 & P1 & P2 & P3);

    assign S[0] = Cin ^ P0;
    assign S[1] = C1 ^ P1;
    assign S[2] = C2 ^ P2;
    assign S[3] = C3 ^ P3;

endmodule
