module or4 (A, B, out);
    
    input [1:0] A;
    input [1:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or2 sub0 (.A(A[0]), .B(B[0]), .out(subor[0]));
    or2 sub1 (.A(A[1]), .B(B[1]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
