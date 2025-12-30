//---------------------
//instruction memory
//---------------------

import risc_pkg::*;
module instruction_memory #(
    parameter ADDR_WIDTH = 7,       //address bit (depth = 2^7 = 128)
    parameter DATA_WIDTH = 8        //data width per memory
)(
    input logic             imem_req,
    input logic [31:0]      imem_addr,
    output logic [31:0]     imem_data
);


    //-------------------------------------------
    //memory declaration (ROM)
    //-------------------------------------------
    logic [DATA_WIDTH - 1 : 0] mem [0 : (2**ADDR_WIDTH) - 1];   //128 memory locations each of 8 bits
    
    initial begin
        $readmemh("machine_code.mem", mem);                 //initializing ROM with data
    end
    

    //-----------------------
    //read logic
    //-----------------------
    always_comb begin
        if(imem_req) begin
            imem_data = {
                mem[imem_addr],
                mem[imem_addr + 1],
                mem[imem_addr + 2],
                mem[imem_addr + 3]
            };
        end

        else begin
            imem_data = 32'd0;
        end
    end
    
    
endmodule