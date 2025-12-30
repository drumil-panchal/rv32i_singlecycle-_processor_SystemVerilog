import risc_pkg::*;
module fetch(
    input logic reset_n,
    input logic clk,
    
    input logic [31:0] pc,                            //input for program counter
    input logic [31:0] imem_data,            //data that is read from instruction memory
    
    output logic imem_req,                    //instruction memory request
    output logic [31:0] imem_addr,      //address to instruction memory
    output logic [31:0] instruction        //decoded instruction
    );
    
    logic req_reg;
    
    always_ff @(posedge clk or negedge reset_n) begin 
        if(!reset_n)
            req_reg <= 1'b0;            
        else
            req_reg <= 1'b1;            
    end 
    
    assign imem_req = req_reg;
    assign imem_addr = pc;
    assign instruction = imem_data;
endmodule
