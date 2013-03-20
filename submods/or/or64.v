module or64 (a, b, out);
    
    input [31:0] a;
    input [31:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or32 sub0 (.a(a[15:0]), .b(b[15:0]), .out(subor[0]));
    or32 sub1 (.a(a[31:16]), .b(b[31:16]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
