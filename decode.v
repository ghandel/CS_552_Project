module decode (instruction, write_data, clk, rst, read1data, read2data, 
                sign_ext_out, alu_op, mem_read_en, mem_wr_en, reg_wr_en, 
                br_ju_en, err);

    input [15:0] instruction;
    input [15:0] write_data;
    input clk, rst;
    
    output [15:0] read1data;
    output [15:0] read2data;
    output [15:0] sign_ext_out;
    output [2:0] alu_op;
    output mem_read_en;
    output mem_wr_en;
    output reg_wr_en;
    output br_ju_en;
    output err;
    
    wire [15:0] btr;
    wire [2:0] write_reg;
    //wire [2:0] alu_op;
    wire [1:0] regdst;
    wire jump_en;
    wire branch_en;
    wire sign_op;
    wire err_reg, err_reg_sel;
    wire btr_sel;

    assign err = err_reg | err_reg_sel;
    assign br_ju_en = jump_en | branch_en;
    
    assign btr_en =  instruction[15] & instruction[14] & ~instruction[13] & ~instruction[12] & instruction[11];
    assign btr[15:0] = 4'hffff;
    
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
                      .D(instruction[4:2]),    // should never output this one
                      .sel(regdst[1:0]), 
                      .out(write_reg[2:0]));
    
    assign err_reg_sel = regdst[0] & regdst[1];
    
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
    
    sign_ext ext0 (.in(instruction[7:0]),               //NEED TO SET SIGN_OP!!!!!!!!!!!!!!!!!!
                   .op(sign_op),                             // op is whether to 
                   .out(sign_ext_out[15:0]));     // extend for 8 bits or 5 bits
    
    // ALU Select
    
    mux32_16 alu_sel (.A(read2data[15:0]),
                      .B(sign_ext_out[15:0]), 
                      .sel(alu_op[2]), 
                      .out(read2data[15:0]));
    
    // BTR Select
    
    mux32_16 btr_sel (.A(read2data[15:0]),
                      .B(btr[15:0]),
                      .sel(btr_en),
                      .out(read2data[15:0]));
    
endmodule
