module shift_sel (a, b, c, d, sel, out);

    input [15:0] a;
    input [15:0] b;
    input [15:0] c;
    input [15:0] d;
    input [1:0] sel;
    
    output [15:0] out;
    
    mux_4by16 mux0 (.inA(a[15:0]), .inB(b[15:0]), .inC(c[15:0]), .inD(d[15:0]), .sel(sel[1:0]), .out(out[15:0]));
    
endmodule
