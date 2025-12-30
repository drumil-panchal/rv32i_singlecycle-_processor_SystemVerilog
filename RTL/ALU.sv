//------------------------------------
//ALU
//-----------------------------------

import risc_pkg::*;

module ALU(
    input logic [31:0] alu_a,
    input logic [31:0] alu_b,
    input alu_op_t alu_op,
    output logic [31:0] alu_res
    );
    
    //signed version for comparison/shift operations
    logic signed [31:0] signed_a;
    logic signed [31:0] signed_b;
    
    assign signed_a = alu_a;
    assign signed_b = alu_b;
    
    //operation logic
    always_comb begin 
        alu_res = 32'd0;                                            //default result set to 0
        
        case(alu_op)
            ADD_op	:	alu_res = alu_a + alu_b;
            SUB_op	:	alu_res = alu_a - alu_b;
            
            SLL_op	:	alu_res = alu_a << alu_b[4:0];
            SRL_op	:	alu_res = alu_a >> alu_b[4:0];
            SRA_op	:	alu_res = signed_a >>> alu_b[4:0];
            
            OR_op	:	alu_res = alu_a | alu_b;
            AND_op	:	alu_res = alu_a & alu_b;
            XOR_op	:	alu_res = alu_a ^ alu_b;
            
            SLTU_op	:	alu_res = (alu_a < alu_b) ? 32'd1 : 32'd0;
            SLT_op	:	alu_res = (signed_a < signed_b) ? 32'd1 : 32'd0;
        endcase 
    end 
endmodule
