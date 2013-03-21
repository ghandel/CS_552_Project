/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */

module sc( clk, rst, ctr_rst, out, err);

   input clk;
   input rst;
   input ctr_rst;
   output [2:0] out;
   output err;

   // your code
   
   reg [2:0] out;
   reg err;
    
    assign ctr_rst = 1'b1;
    
    always @(posedge clk)
    begin
        case(ctr_rst)
            1'b0:
                begin
                    case({out[2], out[1], out[0]})
                        3'b0_0_0:
                            begin
                                out[0] = 1'b1;
                            end
                        3'b0_0_1:
                            begin
                                out[0] = 1'b0;
                                out[1] = 1'b1;
                            end
                        3'b0_1_0:
                            begin
                                out[0] = 1'b1;
                                out[1] = 1'b1;
                            end
                        3'b0_1_1:
                            begin
                                out[0] = 1'b0;
                                out[1] = 1'b0;
                                out[2] = 1'b1;
                            end
                        3'b1_0_0:
                            begin
                                out[0] = 1'b1;
                                out[2] = 1'b1;
                            end
                        3'b1_0_1:
                            begin
                                out[0] = 1'b1;
                                out[2] = 1'b1;
                            end
                        default:
                            begin
                                err = 1'b1;
                            end
                    endcase
                end
            1'b1:
                begin
                    out[0] = 1'b0;
                    out[1] = 1'b0;
                    out[2] = 1'b0;
                end
            default:
                begin
                    err = 1'b1;
                end
        endcase
    end
    
endmodule

// DUMMY LINE FOR REV CONTROL :1:
