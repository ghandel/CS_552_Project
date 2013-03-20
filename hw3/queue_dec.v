module queue_dec (in, out);

    input [3:0] in;
    
    output [1:0] out;
    
    wire and0, and1, and2, and3;
    
    assign and0 = ~in[0] & ~in[1] & ~in[2] & ~in[3];
    assign and1 = in[0] & ~in[1] & ~in[2] & ~in[3];
    assign and2 = in[0] & in[1] & ~in[2] & ~in[3];
    assign and3 = in[0] & in[1] & in[2] & ~in[3];
    
    assign out[0] = and0 | and1;
    assign out[1] = and2 | and3;
    
endmodule    
