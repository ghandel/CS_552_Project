module or8 (a, b, out);
    
    input [3:0] a;
    input [3:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or4 sub0 (.a(a[1:0]), .b(b[1:0]), .out(subor[0]));
    or4 sub1 (.a(a[3:2]), .b(b[3:2]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
