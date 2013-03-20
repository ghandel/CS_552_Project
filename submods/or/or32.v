module or32 (a, b, out);
    
    input [15:0] a;
    input [15:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or16 sub0 (.a(a[7:0]), .b(b[7:0]), .out(subor[0]));
    or16 sub1 (.a(a[15:8]), .b(b[15:8]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
