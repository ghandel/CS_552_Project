module instruction_ctl (
                        // Inputs                        
                        op, alu_ctl,
                        // Outputs
                        regdst, jump, branch, memread, alu_op, memwrite, regwrite);

    input [4:0] op;
    input [1:0] alu_ctl;
    
    output [1:0] regdst;
    output [2:0] alu_op;
    output jump, branch, memread, memwrite, regwrite;
    
    wire arith_r,  shift_r, shift_c; // Flags for R-format instructions
    wire arith_i, shift_i;           // Flags for I-format instructions
    wire load_i, sload_i;            // Flags for Load Imm. instructions
    wire j, jr;                      // Flags for Jump instructions
    wire i_form1, i_form2, r_form, j_form;
    
    assign arith_i = ~op[4] & op[3] & ~op[2];
    assign arith_r = op[4] & op[3] & ~op[2] & op[1] & op[0];
    
    assign shift_i = op[4] & ~op[3] & op[2];
    assign shift_r = op[4] & op[3] & ~op[2] & op[1] & ~op[0];
    assign shift_c = op[4] & op[3] & op[2];
    
    assign load_i = op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
    assign sload_i = op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
    
    assign j = ~op[4] & ~op[3] & op[2] & ~op[0];
    assign jr = ~op[4] & ~op[3] & op[2] & op[0];
    
    assign i_form1 = arith_i | shift_i;
    assign i_form2 = branch | jr | load_i | sload_i;
    assign r_form = arith_r | shift_r | shift_c;
    assign j_form = ~(i_form1 | i_form2 | r_form);
    
    
    assign alu_op[2] = i_form1 | i_form2;
    mux4_2 alu_mux (.A(alu_ctl[1:0]), .B(op[1:0]), .sel(alu_op[2]), .out(alu_op[1:0]));
    
    assign regdst[0] = arith_i | shift_i;
    assign regdst[1] = arith_r | shift_r | shift_c;
    assign regwrite = memread | arith_r | arith_i | shift_r | shift_i | shift_c;
    
    assign jump = ~op[4] & ~op[3] & op[2];
    assign branch = ~op[4] & op[3] & op[2];
    
    assign memread = op[4] & ~op[3] & ~op[2] & ~op[1] & op[0];
    assign memwrite = op[4] & ~op[3] & ~op[2] & ((~op[1] & ~op[0]) | (op[1] & op[0]));
    
endmodule
