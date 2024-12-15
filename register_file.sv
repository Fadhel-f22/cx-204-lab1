`timescale 1ns / 1ps


module register_file #(parameter REGF_WIDTH = 16, parameter ALU_WIDTH = 16) (
    input logic clk,
    input logic [5:0]instruction,
    input logic  [ALU_WIDTH - 1 : 0]Alu_result,
    output logic [REGF_WIDTH - 1 : 0]op1,
    output logic [REGF_WIDTH - 1 : 0]op2
    );
    

    logic [1:0]rs1;
    logic [1:0]rs2;  
    logic [1:0]rd;
    
    assign instruction[1:0] = rs1;
    assign instruction[3:2] = rs2;
    assign instruction[5:4] = rd;

    logic [REGF_WIDTH - 1 : 0]reg_memory [3:0];    // x0, x1, x2, x3
            
    initial begin
         $readmemb("rom_image_bin.mem", reg_memory);
    end
    
    // for op1
    assign op1 = (rs1 == 2'b00) ? reg_memory[0] :
                 (rs1 == 2'b01) ? reg_memory[1] :
                 (rs1 == 2'b10) ? reg_memory[2] : reg_memory[3] ;
    
    // for op2               
    assign op2 = (rs2 == 2'b00) ? reg_memory[0] :                
                 (rs2 == 2'b01) ? reg_memory[1] :                
                 (rs2 == 2'b10) ? reg_memory[2] : reg_memory[3] ;
    
    //decoder 
    always @ (posedge clk)
    begin
        case (rd)
        2'b00 : reg_memory[0] <= Alu_result;    
        2'b01 : reg_memory[1] <= Alu_result;
        2'b10 : reg_memory[2] <= Alu_result;
        2'b11 : reg_memory[3] <= Alu_result;   
        endcase
    end   
                  
endmodule
