module regselcheck (write, read, out);

    input [2:0] write;
    input [2:0] read;
    
    output out;
    
    wire x0, x1, x2;
    
    assign x0 = write[0] ^ read[0];
    assign x1 = write[1] ^ read[1];
    assign x2 = write[2] ^ read[2];
    
    assign out = ~(x0 | x1 | x2);

endmodule
