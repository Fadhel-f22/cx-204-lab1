`timescale 1ns / 1ps

module instruction_memory #(parameter IMEM_DEPTH=4)(
    input logic [$clog2(IMEM_DEPTH)-1:0] address,
    output logic [7:0] instruction
   );
   
    logic [7:0] Instruction_Memory [0:IMEM_DEPTH]; 
       
    initial begin        
     $readmemb("/home/it/cx-204/lab1/support_files/fib_im.mem", Instruction_Memory);    
    end
        assign instruction=Instruction_Memory[address];
        
endmodule
