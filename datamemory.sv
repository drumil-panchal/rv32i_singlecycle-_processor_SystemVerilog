//-----------------------------
//data memory
//-----------------------------
import risc_pkg::*;
module datamemory #(
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic dmem_req,
    input logic dmem_wr_en,
    input mem_size_t dmem_data_size,
    input logic [31:0] dmem_addr,
    input logic [31:0] dmem_wr_data,
    input logic dmem_zero_extend,
    
    output logic [31:0] dmem_rd_data
    );
    
    logic [DATA_WIDTH - 1 : 0] mem [0 : (2**ADDR_WIDTH) - 1];
    
    //write logic
    always_ff @(posedge clk) begin
        if (dmem_req && dmem_wr_en) begin
            case(dmem_data_size)
                byte_size: mem[dmem_addr] <= dmem_wr_data[7:0];
                halfword_size: {mem[dmem_addr+1], mem[dmem_addr]} <= dmem_wr_data[15:0];
                word_size: {mem[dmem_addr+3], mem[dmem_addr+2], mem[dmem_addr+1], mem[dmem_addr]} <= dmem_wr_data;
            endcase
        end
    end
    
    //read logic
    always_comb begin
        if (dmem_req && !dmem_wr_en) begin
            case(dmem_data_size)
                byte_size: dmem_rd_data = dmem_zero_extend ? {{24{1'b0}}, mem[dmem_addr]} : {{24{mem[dmem_addr][7]}}, mem[dmem_addr]};
                halfword_size: dmem_rd_data = dmem_zero_extend ?
                                            {{16{1'b0}}, mem[dmem_addr+1], mem[dmem_addr]} :
                                            {{16{mem[dmem_addr+1][7]}}, mem[dmem_addr+1], mem[dmem_addr]};
                word_size:     dmem_rd_data = {mem[dmem_addr+3], mem[dmem_addr+2], mem[dmem_addr+1], mem[dmem_addr]};
            endcase
        end
        
        else begin
            dmem_rd_data = 32'd0;
        end
    end
endmodule
