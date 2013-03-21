module execute (read1data, read2data, sign_ext, PC_old, alu_op, br_ju_en,
                read_addr, PC_curr, err);

    input [15:0] read1data;
    input [15:0] read2data;
    input [15:0] sign_ext;
    input [15:0] PC_old;
    input [2:0] alu_op;
    input br_ju_en;
    
    output [15:0] read_addr;
    output [15:0] PC_curr;
    output err;
    
    wire [15:0] br_ju_out;
    wire err_bj_ofl;
    wire err_bj_z;
    
    // Instruction ALU
    
    alu inst_alu (.A(read1data[15:0]), 
                 .B(read2data[15:0]), 
                 .cin(), 
                 .op(alu_op[2:0]), 
                 .invA(1'b0),               // figure this out
                 .invB(), 
                 .sign(), 
                 .out(read_addr[15:0]), 
                 .ofl(ofl), 
                 .Z(zero));
                  
    // Branch/Jump ALU
    
    alu branch_jump_alu (.A(PC_old[15:0]), 
                         .B(sign_ext[15:0]), 
                         .cin(1'b0), 
                         .op(3'b100), 
                         .invA(1'b0), 
                         .invB(1'b0), 
                         .sign(1'b1), 
                         .out(br_ju_out[15:0]), 
                         .ofl(err_bj_ofl), 
                         .Z(err_bj_z));
                         
    // Branch/Jump Select
    
    mux32_16 br_ju_sel (.A(PC_old[15:0]),
                      .B(br_ju_out[15:0]), 
                      .sel(br_ju_en), 
                      .out(PC_curr[15:0]));
                      
endmodule
