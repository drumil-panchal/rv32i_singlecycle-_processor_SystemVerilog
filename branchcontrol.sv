//----------------------------------
//branch control
//--------------------------------

import risc_pkg::*;
module branchcontrol(
    input logic [31:0] opr_a,
    input logic [31:0] opr_b,
    input logic is_b_type,
    input logic [2:0] funct3,
    
    output logic branch_taken
    );
    
    //signed versions
    logic signed [31:0] a_signed, b_signed;
    assign a_signed = opr_a;
    assign b_signed = opr_b;
    
    logic taken;
    
    always_comb begin
        taken = 1'b0;

        case (funct3)
            b_beq  : taken = (opr_a == opr_b);
            b_bne  : taken = (opr_a != opr_b);
            b_blt  : taken = (a_signed <  b_signed);
            b_bge  : taken = (a_signed >= b_signed);
            b_bltu : taken = (opr_a <  opr_b);
            b_bgeu : taken = (opr_a >= opr_b);
        endcase
    end
    
    assign branch_taken = is_b_type & taken;
endmodule
