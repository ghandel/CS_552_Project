/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module fifo(/*AUTOARG*/
   // Outputs
   data_out, fifo_empty, fifo_full, data_out_valid, err, 
   // Inputs
   data_in, data_in_valid, pop_fifo, clk, rst
   );
   input [63:0] data_in;
   input        data_in_valid; // won't use this
   input        pop_fifo;
   
   input        clk;
   input        rst;
   output [63:0] data_out;
   output        fifo_empty;
   output        fifo_full;
   output        data_out_valid; // don't think I need this
   output        err;
   
   //your code here
   wire [63:0] out0;
   wire [63:0] out1;
   wire [63:0] out2;
   wire [63:0] out3;
   wire [63:0] in0;
   wire [63:0] in1;
   wire [63:0] in2;
   wire [63:0] in3;
   wire [1:0] queue_dec_out;
   wire pop_en;
   wire wr_en, wr_en0, wr_en1, wr_en2, wr_en3;
   wire [63:0] zero;
   wire [3:0] or_out;
   
   assign pop_en = pop_fifo & (~fifo_empty);
   assign wr_en = ~fifo_full | pop_en;
   assign zero = 16'h0;

    reg_64bit reg0 (.out(data_out[63:0]), .in(in0[63:0]), .wr_en(wr_en0), .clk(clk), .rst(rst));
    reg_64bit reg1 (.out(out1[63:0]), .in(in1[63:0]), .wr_en(wr_en1), .clk(clk), .rst(rst));
    reg_64bit reg2 (.out(out2[63:0]), .in(in2[63:0]), .wr_en(wr_en2), .clk(clk), .rst(rst));
    reg_64bit reg3 (.out(out3[63:0]), .in(in3[63:0]), .wr_en(wr_en3), .clk(clk), .rst(rst));
    
    //determines pop
    mux128_64 pop0 (.inA(data_out[63:0]), .inB(out1[63:0]), .sel(pop_fifo), .out(in0[63:0]));
    mux128_64 pop1 (.inA(out1[63:0]), .inB(out2[63:0]), .sel(pop_fifo), .out(in1[63:0]));
    mux128_64 pop2 (.inA(out2[63:0]), .inB(out3[63:0]), .sel(pop_fifo), .out(in2[63:0]));
    mux128_64 pop3 (.inA(out3[63:0]), .inB(zero[63:0]), .sel(pop_fifo), .out(in3[63:0]));
    
    //checks contents
    or128 subor0 (.a(out0[63:0]), .b(zero[63:0]), .out(or_out[0]));
    or128 subor1 (.a(out1[63:0]), .b(zero[63:0]), .out(or_out[1]));
    or128 subor2 (.a(out2[63:0]), .b(zero[63:0]), .out(or_out[2]));
    or128 subor3 (.a(out3[63:0]), .b(zero[63:0]), .out(or_out[3]));
    
    //sets fifo_full
    and4 suband (.a(or_out[0]), .b(or_out[1]), .c(or_out[2]), .d(or_out[3]), .out(fifo_full));
    
    //determines data_in destination
    queue_dec dec0 (.in(or_out[3:0]), .out(queue_dec_out[1:0]));    
    
    //sets write status for input
    assign wr_en0 = wr_en & or_out[0];
    assign wr_en1 = wr_en & or_out[1];
    assign wr_en2 = wr_en & or_out[2];
    assign wr_en3 = wr_en & or_out[3];

endmodule
// DUMMY LINE FOR REV CONTROL :1:
