//---------------------------------------------
//risc-v rv21i package
//---------------------------------------------

package risc_pkg;

    //-------------------------------
    //RISC-V opcodes
    //-------------------------------
    typedef enum logic [6:0] {
        opcode_r_type	= 7'h33,
        opcode_i_load	= 7'h03,
        opcode_i_alu	= 7'h13,
        opcode_i_jalr	= 7'h67,
        opcode_s_type	= 7'h23,
        opcode_b_type	= 7'h63,
        opcode_lui	= 7'h37,
        opcode_auipc	= 7'h17,
        opcode_jal	= 7'h6f
    } opcode_t;
    
    //-----------------------------
    //ALU operations
    //-----------------------------
    typedef enum logic [3:0] {
        ADD_op,
        SUB_op,
        SLL_op,
        SLT_op,
        SLTU_op,
        XOR_op,
        SRL_op,
        SRA_op,
        OR_op,
        AND_op
    } alu_op_t;

    //-------------------------------
    //memory access sizes
    //--------------------------------
    typedef enum logic [1:0] {
        byte_size = 2'b00,
        halfword_size = 2'b01,
        word_size = 2'b11
    } mem_size_t;


    //----------------------------------
    //b type instructions funct3
    //----------------------------------
    typedef enum logic [2:0] {
        b_beq = 3'h0,
        b_bne = 3'h1,
        b_blt = 3'h4,
        b_bge = 3'h5,
        b_bltu = 3'h6,
        b_bgeu = 3'h7
    } b_type_instr_t;
    
    //----------------------------------
    //r type
    //----------------------------------
    typedef enum logic [3:0] {
        R_ADD  = 4'h0,
        R_SUB  = 4'h8,
        R_SLL  = 4'h1,
        R_SLT  = 4'h2,
        R_SLTU = 4'h3,
        R_XOR  = 4'h4,
        R_SRL  = 4'h5,
        R_SRA  = 4'hD,
        R_OR   = 4'h6,
        R_AND  = 4'h7
    } r_type_instr_t;
    
    //----------------------------------
    //i type
    //----------------------------------
    typedef enum logic [3:0] {
        I_LB        = 4'h0,
        I_LH        = 4'h1,
        I_LW        = 4'h2,
        I_LBU       = 4'h4,
        I_LHU       = 4'h5,
        I_ADDI      = 4'h8,
        I_SLTI      = 4'hA,
        I_SLTIU     = 4'hB,
        I_XORI      = 4'hC,
        I_ORI       = 4'hE,
        I_ANDI      = 4'hF,
        I_SLLI      = 4'h9,
        I_SRLI_SRAI = 4'hD    // shared funct3
    } i_type_instr_t;
    
    //----------------------------------
    //s type
    //----------------------------------
    typedef enum logic [2:0] {
        S_SB = 3'h0,
        S_SH = 3'h1,
        S_SW = 3'h2
    } s_type_instr_t;
    
    //-----------------------------------------------
    //register file writeback sources
    //----------------------------------------------
    typedef enum logic [1:0] {
        WB_SRC_ALU = 2'b00,
        WB_SRC_MEM = 2'b01,
        WB_SRC_IMM = 2'b10,
        WB_SRC_PC  = 2'b11
    } wb_src_t;
    
    //----------------------------------
    //control signal
    //----------------------------------
    typedef struct packed {
        logic        mem_valid;          // Asserted for memory access
        logic        mem_write;          // 1 = write, 0 = read
        mem_size_t  mem_size;           // BYTE, HALF_WORD, WORD
        logic        load_zero_extend;   // 1 = zero-extend loads (LBU/LHU)
        logic        rf_write_enable;    // Register file write enable
        logic        pc_src_select;      // 1 = branch/jump, 0 = sequential
        logic        alu_src_a_select;   // 1 = PC, 0 = rs1
        logic        alu_src_b_select;   // 1 = IMM, 0 = rs2
        wb_src_t     wb_src;             // Writeback data source
        alu_op_t     alu_op;             // ALU function selector
    } control_t;
    
endpackage


