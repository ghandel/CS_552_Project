module fetch (PC_old, PC_curr, instruction, clk, rst, err);

    input [15:0] PC_old;
    input clk, rst;
    
    output [15:0] PC_curr;
    output [15:0] instruction;
    output err;
    
    wire err_pc_ofl;
    wire err_pc_z;
    
    alu pc_inc (.A(PC_old[15:0]), 
                 .B(16'b10), 
                 .cin(1'b0), 
                 .op(3'b100), 
                 .invA(1'b0), 
                 .invB(1'b0), 
                 .sign(1'b0), 
                 .out(PC_curr[15:0]), 
                 .ofl(err_pc_ofl), 
                 .Z(err_pc_z));
    
    assign err = err_pc_ofl | err_pc_z;
    
    memory2c instructions (.data_out(instruction[15:0]),
                           .data_in(16'b0),
                           .addr(PC_curr[15:0]),
                           .enable(1'b1),
                           .wr(1'b0),
                           .createdump(1'b0),
                           .clk(clk),
                           .rst(rst));
                           
endmodule
