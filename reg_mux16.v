module reg_mux16 (A, B, sel, out);

    input [15:0] A;
    input [15:0] B;
    input sel;
    
    output [15:0] out;
    
    mux2_1 mux0 (.A(A[0]), .B(B[0]), .s(sel), .out(out[0]));
    mux2_1 mux1 (.A(A[1]), .B(B[1]), .s(sel), .out(out[1]));
    mux2_1 mux2 (.A(A[2]), .B(B[2]), .s(sel), .out(out[2]));
    mux2_1 mux3 (.A(A[3]), .B(B[3]), .s(sel), .out(out[3]));
    mux2_1 mux4 (.A(A[4]), .B(B[4]), .s(sel), .out(out[4]));
    mux2_1 mux5 (.A(A[5]), .B(B[5]), .s(sel), .out(out[5]));
    mux2_1 mux6 (.A(A[6]), .B(B[6]), .s(sel), .out(out[6]));
    mux2_1 mux7 (.A(A[7]), .B(B[7]), .s(sel), .out(out[7]));
    mux2_1 mux8 (.A(A[8]), .B(B[8]), .s(sel), .out(out[8]));
    mux2_1 mux9 (.A(A[9]), .B(B[9]), .s(sel), .out(out[9]));
    mux2_1 mux10 (.A(A[10]), .B(B[10]), .s(sel), .out(out[10]));
    mux2_1 mux11 (.A(A[11]), .B(B[11]), .s(sel), .out(out[11]));
    mux2_1 mux12 (.A(A[12]), .B(B[12]), .s(sel), .out(out[12]));
    mux2_1 mux13 (.A(A[13]), .B(B[13]), .s(sel), .out(out[13]));
    mux2_1 mux14 (.A(A[14]), .B(B[14]), .s(sel), .out(out[14]));
    mux2_1 mux15 (.A(A[15]), .B(B[15]), .s(sel), .out(out[15]));
    
endmodule
    
