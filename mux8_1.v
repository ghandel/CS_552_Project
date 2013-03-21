module mux8_1 (in, s, out);

    input [7:0] in;
    input [2:0] s;
    
    output out;
    
    wire [3:0] m_out_0;
    wire [1:0] m_out_1;
    
    mux2_1 mux0 (.A(in[0]), .B(in[1]), .s(s[0]), .out(m_out_0[0]));
    mux2_1 mux1 (.A(in[2]), .B(in[3]), .s(s[0]), .out(m_out_0[1]));
    mux2_1 mux2 (.A(in[4]), .B(in[5]), .s(s[0]), .out(m_out_0[2]));
    mux2_1 mux3 (.A(in[6]), .B(in[7]), .s(s[0]), .out(m_out_0[3]));
    
    mux2_1 mux4 (.A(m_out_0[0]), .B(m_out_0[1]), .s(s[1]), .out(m_out_1[0]));
    mux2_1 mux5 (.A(m_out_0[2]), .B(m_out_0[3]), .s(s[1]), .out(m_out_1[1]));
    
    mux2_1 mux6 (.A(m_out_1[0]), .B(m_out_1[1]), .s(s[2]), .out(out));
    
endmodule
    
