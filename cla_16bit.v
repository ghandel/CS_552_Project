module cla_16bit (A, B, cin, cout, out);

    input [15:0] A;
    input [15:0] B;
    input cin;
    
    output [15:0] out;
    output cout;
    
    wire out_0, out_1, out_2;
    
    cla_4bit cla_0 (.A(A[3:0]), 
                    .B(B[3:0]), 
                    .s(out[3:0]), 
                    .cin(cin), 
                    .cout(out_0));
                    
    cla_4bit cla_1 (.A(A[7:4]), 
                    .B(B[7:4]), 
                    .s(out[7:4]), 
                    .cin(out_0), 
                    .cout(out_1));
                    
    cla_4bit cla_2 (.A(A[11:8]), 
                    .B(B[11:8]), 
                    .s(out[11:8]), 
                    .cin(out_1), 
                    .cout(out_2));
                    
    cla_4bit cla_3 (.A(A[15:12]), 
                    .B(B[15:12]), 
                    .s(out[15:12]), 
                    .cin(out_2), 
                    .cout(cout));
                    
endmodule
