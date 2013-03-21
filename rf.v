/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
           
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;

   // your code
    
    wire [15:0] out0;
    wire [15:0] out1;
    wire [15:0] out2;
    wire [15:0] out3;
    wire [15:0] out4;
    wire [15:0] out5;
    wire [15:0] out6;
    wire [15:0] out7;
    wire [7:0] dec_out_write;
    wire [7:0] dec_out_read1;
    wire [7:0] dec_out_read2;
    wire w0, w1, w2, w3, w4, w5, w6, w7;
    
    
    decoder_3to8 dec_01 (.out(dec_out_write[7:0]), .in(writeregsel[2:0]));
    decoder_3to8 dec_02 (.out(dec_out_read1[7:0]), .in(read1regsel[2:0]));
    decoder_3to8 dec_03 (.out(dec_out_read2[7:0]), .in(read2regsel[2:0]));
    
    assign w0 = dec_out_write[0] & write & clk;
    assign w1 = dec_out_write[1] & write & clk;
    assign w2 = dec_out_write[2] & write & clk;
    assign w3 = dec_out_write[3] & write & clk;
    assign w4 = dec_out_write[4] & write & clk;
    assign w5 = dec_out_write[5] & write & clk;
    assign w6 = dec_out_write[6] & write & clk;
    assign w7 = dec_out_write[7] & write & clk;
    
    mux_8by16bit read1 (.A(out0[15:0]), 
                        .B(out1[15:0]), 
                        .C(out2[15:0]), 
                        .D(out3[15:0]), 
                        .E(out4[15:0]), 
                        .F(out5[15:0]), 
                        .G(out6[15:0]), 
                        .H(out7[15:0]), 
                        .sel(read1regsel[2:0]), 
                        .out(read1data[15:0]));
                        
    mux_8by16bit read2 (.A(out0[15:0]), 
                        .B(out1[15:0]), 
                        .C(out2[15:0]), 
                        .D(out3[15:0]), 
                        .E(out4[15:0]), 
                        .F(out5[15:0]), 
                        .G(out6[15:0]), 
                        .H(out7[15:0]), 
                        .sel(read2regsel[2:0]), 
                        .out(read2data[15:0]));
    
    reg_16bit reg_0 (.out(out0[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w0), .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_1 (.out(out1[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w1), .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_2 (.out(out2[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w2), 
                     .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_3 (.out(out3[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w3), 
                     .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_4 (.out(out4[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w4), 
                     .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_5 (.out(out5[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w5), 
                     .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_6 (.out(out6[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w6), 
                     .clk(clk), 
                     .rst(rst));
                     
    reg_16bit reg_7 (.out(out7[15:0]), 
                     .in(writedata[15:0]), 
                     .wr_en(w7), 
                     .clk(clk), 
                     .rst(rst));
                     
endmodule
// DUMMY LINE FOR REV CONTROL :1:
