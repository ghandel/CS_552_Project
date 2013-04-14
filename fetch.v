module fetch (PC_in, PC_out, halt, instruction, clk, rst, err);

    input [15:0] PC_in;    // current PC to be updated
    input halt;             // determines if HALT was called
    input clk, rst;
    
    output [15:0] PC_out;
    output [15:0] instruction;
    output err;
    
    wire err_pc_ofl;
    wire err_pc_z;

    wire [15:0] PC_reg_out;
    //wire [15:0] pc_inc_in;
    //wire [15:0] pc_inc_out;
    
    reg_16bit PC (.out(PC_out),
                    .in(PC_in), 
                    .wr_en(~halt), 
                    .clk(clk), 
                    .rst(rst));
                    
    /*reg_16bit PC_inc (.out(pc_inc_out),
                    .in(pc_inc_out), 
                    .wr_en(1'b1), 
                    .clk(clk), 
                    .rst(rst));*/
    
    //assign err = err_pc_ofl | err_pc_z;
    
    memory2c instructions (.data_out(instruction[15:0]),
                           .data_in(16'b0),
                           .addr(PC_out),
                           .enable(1'b1),
                           .wr(1'b0),
                           .createdump(1'b0),
                           .clk(clk),
                           .rst(rst));
                           
endmodule
