module dff_en (q, d, en, clk, rst);

  output q;
  input d;
  input en;
  input clk;
  input rst;

  wire mux_out;

  mux2_1 mux (.A(q), .B(d), .s(en), .out(mux_out));

  dff dff_0 (.q(q), .d(mux_out), .clk(clk), .rst(rst));
  
endmodule
