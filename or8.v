module or8 (A, B, out);
    
    input [3:0] A;
    input [3:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or4 sub0 (.A(A[1:0]), .B(B[1:0]), .out(subor[0]));
    or4 sub1 (.A(A[3:2]), .B(B[3:2]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
