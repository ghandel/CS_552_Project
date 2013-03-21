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
    wire [1:0] regdst;
    wire jump_en;
    wire branch_en;
    wire mem_read_en;
    wire mem_wr_en;
    wire reg_wr_en;
    wire [15:0] read1data;
    wire [15:0] read2data;
    wire [15:0] write_data;
    wire [2:0] alu_op;
    wire [2:0] write_reg;
    wire [15:0] sign_ext_out;
    wire sign_op;
    wire [15:0] alu_to_wb;
    wire [15:0] br_ju_out;
    wire br_ju_en;
    wire [15:0] mem_data_out;
    wire zero;
    wire err_pc_ofl;
    wire err_pc_z;
    wire err_reg;
    wire err_bj_ofl;
    wire err_bj_z;
    
    assign err = err_pc_ofl | err_pc_z | err_reg | err_bj_ofl | err_bj_z;
    assign br_ju_en = jump_en | branch_en;
    
    // PC Increment
    
    alu pc_inc (.A(PC[15:0]), 
                 .B(16'b10), 
                 .cin(1'b0), 
                 .op(3'b100), 
                 .invA(1'b0), 
                 .invB(1'b0), 
                 .sign(1'b0), 
                 .out(PC[15:0]), 
                 .ofl(err_pc_ofl), 
                 .Z(err_pc_z));
    
    // Instruction Mem
    
    memory2c instructions (.data_out(instruction[15:0]),
                           .data_in(16'b0),
                           .addr(PC[15:0]),
                           .enable(1'b1),
                           .wr(1'b0),
                           .createdump(1'b0),
                           .clk(clk),
                           .rst(rst));
    
    // Instruction Control
    
    instruction_ctl inst_ctl (.op(instruction[15:11]), 
                              .alu_ctl(instruction[1:0]),
                              .regdst(regdst[1:0]), 
                              .jump(jump_en), 
                              .branch(branch_en), 
                              .memread(mem_read_en), 
                              .alu_op(alu_op[2:0]), 
                              .memwrite(mem_wr_en), 
                              .regwrite(reg_wr_en));
    
    // Write Register Select
    
    mux12_3 write_reg_sel (.A(instruction[10:8]),
                      .B(instruction[7:5]), 
                      .C(instruction[4:2]),
                      .sel(instruction[4:2]),    // should never output this one
                      .sel(regdst[1:0]), 
                      .out(write_reg[2:0]));
    
    // Registers
    
    rf registers (.read1data(read1data[15:0]),
                  .read2data(read2data[15:0]),
                  .err(err_reg),
                  .clk(clk),
                  .rst(rst),
                  .read1regsel(instruction[10:8]),
                  .read2regsel(instruction[7:5]),
                  .writeregsel(write_reg),
                  .writedata(write_data[15:0]),
                  .write(reg_wr_en));
    
    // Sign Extend
    
    sign_ext ext0 (.in(instruction[7:0]), 
                   .op(sign_op),                             // op is whether to 
                   .out(sign_ext_out[15:0]));     // extend for 8 bits or 5 bits
    
    // ALU Select
    
    mux32_16 alu_sel (.A(read2data[15:0]),
                      .B(sign_ext_out[15:0]), 
                      .sel(alu_op[2]), 
                      .out(read2data[15:0]));
    
    // Instruction ALU
    
    alu inst_alu (.A(read1data[15:0]), 
                 .B(read2data[15:0]), 
                 .cin(), 
                 .op(alu_op[2:0]), 
                 .invA(),               // figure this out
                 .invB(), 
                 .sign(), 
                 .out(alu_to_wb[15:0]), 
                 .ofl(ofl), 
                 .Z(zero));
                  
    // Branch/Jump ALU
    
    alu branch_jump_alu (.A(PC[15:0]), 
                         .B(sign_ext_out[15:0]), 
                         .cin(1'b0), 
                         .op(3'b100), 
                         .invA(1'b0), 
                         .invB(1'b0), 
                         .sign(1'b1), 
                         .out(br_ju_out[15:0]), 
                         .ofl(err_bj_ofl), 
                         .Z(err_bj_z));
                         
    // Branch/Jump Select
    
    mux32_16 br_ju_sel (.A(PC[15:0]),
                      .B(br_ju_out[15:0]), 
                      .sel(br_ju_en), 
                      .out(PC[15:0]));
    
    // Data Mem
    
    memory2c data (.data_out(mem_data_out[15:0]),
                   .data_in(read2data[15:0]),
                   .addr(alu_to_wb[15:0]),
                   .enable(mem_read_en),
                   .wr(mem_wr_en),
                   .createdump(1'b0),
                   .clk(clk),
                   .rst(rst));
    
    // Write Data Sel
    
    mux32_16 data_sel (.A(mem_data_out[15:0]),
                      .B(read2data[15:0]), 
                      .sel(mem_read_en), 
                      .out(write_data[15:0]));

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
