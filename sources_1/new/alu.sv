`timescale 1ns / 1ps
module alu #(parameter ALU_WIDTH=16)(
    input [ALU_WIDTH-1:0] op1,
    input [ALU_WIDTH-1:0] op2,
    input [1:0] opcode,

    output logic [ALU_WIDTH-1:0] alu_result
    );
    
    
logic [ALU_WIDTH-1:0]add_result;
logic [ALU_WIDTH-1:0]sub_result;
logic [ALU_WIDTH-1:0]and_result;
logic [ALU_WIDTH-1:0]or_result;

assign add_result = op1 + op2;
assign sub_result = op1 - op2;
assign or_result  = op1 | op2; 
assign and_result = op1 & op2;

always@(*)begin
    case(opcode)
        0:alu_result=add_result;
        1:alu_result=sub_result;
        2:alu_result=and_result;
        3:alu_result=or_result;
    endcase
end
endmodule
