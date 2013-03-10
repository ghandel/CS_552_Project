module mux8_1 (in, s, out);

    input [7:0] in;
    input [2:0] s;
    
    output out;
    
    wire [3:0] m_out_0, [1:0] m_out_1;
    
    mux2_1 mux0 (.in(in[1:0]), .s(s[0]), .out(m_out_0[0]));
    mux2_1 mux0 (.in(in[3:2]), .s(s[0]), .out(m_out_0[1]));
    mux2_1 mux0 (.in(in[5:4]), .s(s[0]), .out(m_out_0[2]));
    mux2_1 mux0 (.in(in[7:6]), .s(s[0]), .out(m_out_0[3]));
    
    mux2_1 mux0 (.in(m_out_0[1:0]), .s(s[1]), .out(m_out_1[0]));
    mux2_1 mux0 (.in(m_out_1[3:2]), .s(s[1]), .out(m_out_1[1]));
    
    mux2_1 mux0 (.in(m_out_1[1:0]), .s(s[2]), .out(out));
    
endmodule
    
