/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf_bypass (
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
   
   wire read1mux_en, read2mux_en;
   wire checkreg1, checkreg2;

   // your code
   
   regselcheck check0 (.write(writeregsel[2:0]), .read(read1regsel[2:0]), .out(checkreg1));
   regselcheck check1 (.write(writeregsel[2:0]), .read(read2regsel[2:0]), .out(checkreg2));
   
   assign read1mux_en = write & checkreg1;
   assign read2mux_en = write & checkreg2;
   
   rf reg_file0 (.read1data(read1data[15:0]), .read2data(read2data[15:0]), .err(err), .clk(clk), .rst(rst), .read1regsel(read1regsel[2:0]), .read2regsel(read2regsel[2:0]), .writeregsel(writeregsel[2:0]), .writedata(writedata[15:0]), .write(write));
   
   reg_mux16 read1mux (.inA(read1data[15:0]), .inB(writedata[15:0]), .sel(read1mux_en), .out(read1data[15:0]));
   reg_mux16 read2mux (.inA(read2data[15:0]), .inB(writedata[15:0]), .sel(read2mux_en), .out(read2data[15:0]));

endmodule
// DUMMY LINE FOR REV CONTROL :1:
