module or128 (a, b, out);
    
    input [63:0] a;
    input [63:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or64 sub0 (.a(a[31:0]), .b(b[31:0]), .out(subor[0]));
    or64 sub1 (.a(a[63:32]), .b(b[63:32]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
