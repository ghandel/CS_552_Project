module memory (addr, read_data, read_en, wr_en, clk, rst, write_data, halt);

    input [15:0] addr;
    input [15:0] read_data;
    input read_en, wr_en;
    input clk, rst;
    
    output [15:0] write_data;
    output [15:0] halt;

    // Data Mem
    
    memory2c data (.data_out(wirte_data[15:0]),
                   .data_in(read_data[15:0]),
                   .addr(addr[15:0]),
                   .enable(read_en),
                   .wr(mem_wr_en),
                   .createdump(1'b0),
                   .clk(clk),
                   .rst(rst));
    
    // Write Data Sel
    
    mux32_16 data_sel (.A(mem_data_out[15:0]),
                      .B(read_data[15:0]), 
                      .sel(read_en), 
                      .out(write_data[15:0]));
                      
endmodule
