module or16_1 (A, B, out);

    input [15:0] A;
    input B;
    
    output [15:0] out;
    
    assign out[0] = A[0] | B;
    assign out[1] = A[1] | B;
    assign out[2] = A[2] | B;
    assign out[3] = A[3] | B;
    assign out[4] = A[4] | B;
    assign out[5] = A[5] | B;
    assign out[6] = A[6] | B;
    assign out[7] = A[7] | B;
    assign out[8] = A[8] | B;
    assign out[9] = A[9] | B;
    assign out[10] = A[10] | B;
    assign out[11] = A[11] | B;
    assign out[12] = A[12] | B;
    assign out[13] = A[13] | B;
    assign out[14] = A[14] | B;
    assign out[15] = A[15] | B;
    
endmodule
