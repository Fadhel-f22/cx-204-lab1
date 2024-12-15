`timescale 1ns / 1ps


module register_file #(parameter REGF_WIDTH = 16) (
    input logic clk,
    input logic [5:0]instruction,
    input logic  [REGF_WIDTH - 1 : 0]Alu_result,
    output logic [REGF_WIDTH - 1 : 0]op1,
    output logic [REGF_WIDTH - 1 : 0]op2
    );
    

    logic [1:0]rs1;
    logic [1:0]rs2;  
    logic [1:0]rd;
    
    assign  rs1 = instruction[1:0] ;
    assign  rs2 = instruction[3:2] ;
    assign  rd = instruction[5:4] ;

    logic [REGF_WIDTH - 1 : 0]reg_memory [3:0];    // x0, x1, x2, x3
            
    initial begin
         $readmemb("/home/it/cx-204/lab1/support_files/fib_rf.mem", reg_memory);
    end
    
    // for op1
    assign op1 = reg_memory[rs1];
//    assign op1 = (rs1 == 2'b00) ? reg_memory[0] :
//                 (rs1 == 2'b01) ? reg_memory[1] :
//                 (rs1 == 2'b10) ? reg_memory[2] : reg_memory[3] ;
    
    // for op2               
    assign op2 = reg_memory[rs2];
//    assign op2 = (rs2 == 2'b00) ? reg_memory[0] :                
//                 (rs2 == 2'b01) ? reg_memory[1] :                
//                 (rs2 == 2'b10) ? reg_memory[2] : reg_memory[3] ;
    
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
