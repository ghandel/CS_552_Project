module or32 (A, B, out);
    
    input [15:0] A;
    input [15:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or16 sub0 (.A(A[7:0]), .B(B[7:0]), .out(subor[0]));
    or16 sub1 (.A(A[15:8]), .B(B[15:8]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
