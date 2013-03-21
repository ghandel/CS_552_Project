/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
/*----------------------------------------------------------------------------*/
    
    // PC
    
    wire [15:0] PC;
    wire [15:0] instruction;
    wire [15:0] read1data;
    wire [15:0] read2data;
    wire [15:0] write_data;
    wire [15:0] sign_ext;
    
    wire [2:0] alu_op;
    
    wire mem_read_en;
    wire mem_wr_en;
    wire reg_wr_en;
    wire br_ju_en;
    
    wire err_fetch;
    wire err_decode;
    wire err_execute;
    wire err_memory;
    wire err_halt;
    
    fetch fetch0 (.PC_old(PC[15:0]), 
                  .PC_curr(PC[15:0]), 
                  .instruction(instruction[15:0]), 
                  .clk(clk), 
                  .rst(rst), 
                  .err(err_fetch));
                  
    decode decode0 (.instruction(instruction[15:0]), 
                    .write_data(write_data[15:0]), 
                    .clk(clk), 
                    .rst(rst), 
                    .read1data(read1data[15:0]), 
                    .read2data(read2data[15:0]), 
                    .sign_ext_out(sign_ext[15:0]), 
                    .alu_op(alu_op[2:0]), 
                    .mem_read_en(mem_read_en), 
                    .mem_wr_en(mem_wr_en), 
                    .reg_wr_en(reg_wr_en), 
                    .br_ju_en(br_ju_en), 
                    .err(err_decode));
                    
    execute execute0 (.read1data(read1data[15:0]), 
                      .read2data(read2data[15:0]), 
                      .sign_ext(sign_ext[15:0]), 
                      .PC_old(PC[15:0]), 
                      .alu_op(alu_op[2:0]), 
                      .br_ju_en(br_ju_en),
                      .PC_curr(PC[15:0]), 
                      .err(err_execute));
                      
    memory memory0 (.addr(read1data[15:0]), 
                    .read_data(read2data[15:0]), 
                    .read_en(mem_read_en), 
                    .wr_en(mem_wr_en), 
                    .clk(clk), 
                    .rst(rst), 
                    .write_data(write_data[15:0])
                    .halt(err_halt));
    
    assign err = err_fecth | err_decode | err_execute | err_halt;
    
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
