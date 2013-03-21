module or16 (A, B, out);
    
    input [7:0] A;
    input [7:0] B;
    
    output out;
    
    wire [1:0] subor;
    
    or8 sub0 (.A(A[3:0]), .B(B[3:0]), .out(subor[0]));
    or8 sub1 (.A(A[7:4]), .B(B[7:4]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
