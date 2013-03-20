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
    wire cin_zero;
    
    // PC Increment
    
    alu pc_inc (.A(PC[15:0]), 
                 .B(16'b10), 
                 .Cin(1'b0), 
                 .Op(3'b0), 
                 .invA(1'b0), 
                 .invB(1'b0), 
                 .sign(1'b0), 
                 .Out(PC[15:0]), 
                 .Ofl(err_pc_ofl), 
                 .Z(err_pc_z));
    
    // Instruction Mem
    
    memory2c instructions (.data_out(),
                           .data_in(),
                           .addr(),
                           .enable(),
                           .wr(),
                           .createdump(),
                           .clk(clk),
                           .rst(rst));
    
    // Instruction Control
    
    instruction_ctl inst_ctl (.op(), 
                              .alu_ctl(),
                              .regdst(), 
                              .jump(), 
                              .branch(), 
                              .memread(), 
                              .alu_op(), 
                              .memwrite(), 
                              .regwrite());
    
    // Write Register Select
    
    mux12_3 write_reg_sel (.inA(),
                      .inB(), 
                      .sel(), 
                      .out());
    
    // Registers
    
    rf registers (.read1data(),
                  .read2data(),
                  .err(reg_err),
                  .clk(clk),
                  .rst(rst),
                  .read1regsel(),
                  .read2regsel(),
                  .writeregsel(),
                  .writedata(),
                  .write());
    
    // Sign Extend
    
    sign_ext ext0 (.in(), // Op is whether to extend for 8 bits or 5 bits
                   .op(),
                   .out()); 
    
    // ALU Select
    
    mux32_16 alu_sel (.inA(),
                      .inB(), 
                      .sel(), 
                      .out());
    
    // Instruction ALU
    
    alu inst_alu (.A(), 
                 .B(), 
                 .Cin(), 
                 .Op(), 
                 .invA(), 
                 .invB(), 
                 .sign(), 
                 .Out(), 
                 .Ofl(), 
                 .Z());
                  
    // Branch/Jump ALU
    
    alu branch_jump_alu (.A(), 
                         .B(), 
                         .Cin(), 
                         .Op(), 
                         .invA(), 
                         .invB(), 
                         .sign(), 
                         .Out(), 
                         .Ofl(), 
                         .Z());
                         
    // Branch Select
    
    mux32_16 branch_sel (.inA(),
                      .inB(), 
                      .sel(), 
                      .out());
    
    // Jump Select
    
    mux32_16 jump_sel (.inA(),
                      .inB(), 
                      .sel(), 
                      .out());
    
    // Data Mem
    
    memory2c data (.data_out(),
                   .data_in(),
                   .addr(),
                   .enable(),
                   .wr(),
                   .createdump(),
                   .clk(clk),
                   .rst(rst));
    
    // Write Data Sel
    
    mux32_16 data_sel (.inA(),
                      .inB(), 
                      .sel(), 
                      .out());

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
