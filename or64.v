module or64 (A, B, out);
    
    input [31:0] A;
    input [31:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or32 sub0 (.A(A[15:0]), .B(B[15:0]), .out(subor[0]));
    or32 sub1 (.A(A[31:16]), .B(B[31:16]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
