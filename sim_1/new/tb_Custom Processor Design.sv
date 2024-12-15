`timescale 1ns / 1ps


module tb_Custom_Processor_Design;

    logic clk;
    logic reset_n;

top processor (
    .clk(clk),
    .reset_n(reset_n)
    );
    
always #5 clk = ~clk;     
initial begin    
#5
    clk = 1'b0;
    reset_n = 1'b1;
#5
    reset_n = 1'b0;
#5
    reset_n = 1'b1;    

#2000
$finish;
end
endmodule
