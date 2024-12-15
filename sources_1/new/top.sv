`timescale 1ns / 1ps


module top #(parameter ALU_WIDTH=16, parameter IMEM_DEPTH=4, parameter PROG_VALUE = 3, parameter REGF_WIDTH = 16)(
    input logic clk,
    input logic reset_n
    );
    
    
    logic [$clog2(PROG_VALUE) - 1 : 0] proram_counter;
    logic [7:0]instruction;
    logic [REGF_WIDTH - 1 : 0]Alu_out;
    logic [ALU_WIDTH - 1 : 0]Alu_result;
    logic [REGF_WIDTH - 1 : 0]op1;
    logic [REGF_WIDTH - 1 : 0]op2;
    
    assign Alu_out = Alu_result;


// program counter    
program_counter #(.PROG_VALUE(PROG_VALUE)) pc (
    .clk(clk),
    .reset_n(reset_n),
    .PC(proram_counter)
    );
    
// Instruction Memory    
instruction_memory #(.IMEM_DEPTH(IMEM_DEPTH)) IM(
    .address(proram_counter),
    .instruction(instruction)
    );

// REgister File    
register_file #(.REGF_WIDTH(REGF_WIDTH)) RF(
    .clk(clk),
    .instruction(instruction[7:2]),
    .Alu_result(Alu_out),
    .op1(op1),
    .op2(op2)
    );
 
// ALU   
alu #(.ALU_WIDTH(ALU_WIDTH)) ALU (
    .op1(op1),
    .op2(op2),
    .opcode(instruction[1:0]),
    .alu_result(Alu_result)
    );    
         
endmodule
