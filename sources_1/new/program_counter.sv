`timescale 1ns / 1ps


module program_counter #(parameter PROG_VALUE = 3)(
    input logic clk,
    input logic reset_n,
    output logic [$clog2(PROG_VALUE) - 1 : 0]PC 
    );
    
always @ (posedge clk, negedge reset_n)
begin
    if (!reset_n)
        PC <= 'b0 ;
    else if (PC == 3 )
        PC <= 'b0 ;
    else 
        PC <= PC + 1 ;     
end    

endmodule
