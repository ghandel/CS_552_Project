module or16 (a, b, out);
    
    input [7:0] a;
    input [7:0] b;
    
    output out;
    
    wire [1:0] subor;
    
    or8 sub0 (.a(a[3:0]), .b(b[3:0]), .out(subor[0]));
    or8 sub1 (.a(a[7:4]), .b(b[7:4]), .out(subor[1]));
    
    assign out = subor[0] | subor[1];
    
endmodule
