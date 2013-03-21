module cla_4bit (A, B, s, cin, cout);

    input [3:0] A;
    input [3:0] B;
    input cin;

    output [3:0] s;
    output cout;

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

    assign C1 = G0 | (cin & P0);
    assign C2 = G1 | (G0 & P1) | (cin & P0 & P1);
    assign C3 = G2 | (G1 & P2) | (G0 & P1 & P2) | (cin & P0 & P1 & P2);
    assign cout = G3 | (G2 & P3) | (G1 & P2 & P3) | (G0 & P1 & P2 & P3) | (cin & P0 & P1 & P2 & P3);

    assign s[0] = cin ^ P0;
    assign s[1] = C1 ^ P1;
    assign s[2] = C2 ^ P2;
    assign s[3] = C3 ^ P3;

endmodule
