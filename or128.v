module or128 (A, B, out);
    
    input [63:0] A;
    input [63:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or64 sub0 (.A(A[31:0]), .B(B[31:0]), .out(subor[0]));
    or64 sub1 (.A(A[63:32]), .B(B[63:32]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
