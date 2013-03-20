module or4 (a, b, out);
    
    input [1:0] a;
    input [1:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or2 sub0 (.a(a[0]), .b(b[0]), .out(subor[0]));
    or2 sub1 (.a(a[1]), .b(b[1]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
