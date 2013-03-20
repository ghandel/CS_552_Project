module cla_16bit (a, b, cin, cout, out);

    input [15:0] a;
    input [15:0] b;
    input cin;
    
    output [15:0] out;
    output cout;
    
    wire out_0, out_1, out_2;
    
    cla_4bit cla_0 (.A(a[3:0]), 
                    .B(b[3:0]), 
                    .S(out[3:0]), 
                    .Cin(cin), 
                    .Cout(out_0));
                    
    cla_4bit cla_1 (.A(a[7:4]), 
                    .B(b[7:4]), 
                    .S(out[7:4]), 
                    .Cin(out_0), 
                    .Cout(out_1));
                    
    cla_4bit cla_2 (.A(a[11:8]), 
                    .B(b[11:8]), 
                    .S(out[11:8]), 
                    .Cin(out_1), 
                    .Cout(out_2));
                    
    cla_4bit cla_3 (.A(a[15:12]), 
                    .B(b[15:12]), 
                    .S(out[15:12]), 
                    .Cin(out_2), 
                    .Cout(cout));
                    
endmodule
