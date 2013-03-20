module alu_ctl (inst_op, alu_op, out);

    input [1:0] inst_op;
    input alu_op;
    
    output [2:0] out;
    
    assign out[1:0] = inst_op[1:0];
    assign out[2] = alu_op;
    
endmodule
