`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 17:26:33
// Design Name: 
// Module Name: Pipeline_CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Pipeline_CPU(
    input clk, //Ê±ÖÓ
    input rst, //¸´Î»
    input[31:0] Data_in, //´æ´¢Æ÷Êý¾ÝÊäÈë
    input[31:0] inst_IF, //È¡Ö¸½×¶ÎÖ¸Áî
    output [31:0] PC_out_IF, //È¡Ö¸½×¶ÎPCÊä³ö
    output [31:0] PC_out_ID, //ÒëÂë½×¶ÎPCÊä³ö
    output [31:0] inst_ID, //ÒëÂë½×¶ÎÖ¸Áî
    output [31:0] PC_out_EX, //Ö´ÐÐ½×¶ÎPCÊä³ö
    output MemRW_EX, //Ö´ÐÐ½×¶Î´æ´¢Æ÷¶ÁÐ´
    output MemRW_Mem, //·Ã´æ½×¶Î´æ´¢Æ÷¶ÁÐ´
    output [31:0] Addr_out, //µØÖ·Êä³ö
    output [31:0] Data_out, //CPUÊý¾ÝÊä³ö
    output [31:0] Data_out_WB, //Ð´»ØÊý¾ÝÊä³ö
    output [31:0]x0,
    output [31:0]x1,
    output [31:0]x2,
    output [31:0]x3,
    output [31:0]x4,
    output [31:0]x5,
    output [31:0]x6,
    output [31:0]x7,
    output [31:0]x8,
    output [31:0]x9,
    output [31:0]x10,
    output [31:0]x11,
    output [31:0]x12,
    output [31:0]x13,
    output [31:0]x14,
    output [31:0]x15,
    output [31:0]x16,
    output [31:0]x17,
    output [31:0]x18,
    output [31:0]x19,
    output [31:0]x20,
    output [31:0]x21,
    output [31:0]x22,
    output [31:0]x23,
    output [31:0]x24,
    output [31:0]x25,
    output [31:0]x26,
    output [31:0]x27,
    output [31:0]x28,
    output [31:0]x29,
    output [31:0]x30,
    output [31:0]x31,
    output [4:0]IdEx_rd,
    output [4:0]IdEx_rs1,
    output [4:0]IdEx_rs2,
    output [31:0]IdEx_rs1_val,
    output [31:0]IdEx_rs2_val,
    output [3:0]IdEx_alu_ctrl,
    output IdEx_reg_wen,
    output [31:0]IdEx_imm,
    output IdEx_is_branch,
    output IdEx_is_jal,
    output [31:0]IdEx_inst,
    output [31:0]PC_Ex
    );
    wire [31:0] PC_out_IFID, inst_out_IFID, Rs1_out_ID, Rs2_out_ID, Imm_out_ID;
    wire [31:0] PC_out_IDEX, Inst_out_IDEX, Rs1_out_IDEX, Rs2_out_IDEX, Imm_out_IDEX;
    wire [31:0] PC4_out_EX, ALU_out_EX, Rs2_out_EX;
    wire [31:0] PC_out_EXMem, PC4_out_EXMem, PC_imm_out_EXMem, Inst_out_EXMem, Rs2_out_EXMem, ALU_out_EXMem;
    wire [31:0] PC4_out_MemWB, ALU_out_MemWB, DMem_data_out_MemWB;
    wire [4:0] Rd_addr_out_ID, Rs1_addr_ID, Rs2_addr_ID, Rd_addr_out_IDEX, Rd_addr_out_EXMem, Rd_addr_out_MemWB;
    wire [2:0] ALU_control_ID, ALU_control_out_IDEX;
    wire [1:0] MemtoReg_ID, MemtoReg_out_IDEX, MemtoReg_out_EXMem, MemtoReg_out_MemWB;
    wire valid_IFID, Rs1_used, Rs2_used, MemRW_ID, RegWrite_out_ID, MemRW_out_IDEX, RegWrite_out_IDEX, valid_out_IDEX;
    wire valid_out_EXMem, zero_out_EXMem, MemRW_out_EXMem, RegWrite_out_EXMem, RegWrite_out_MemWB;
    wire ALUSrc_B_ID, ALUSrc_B_out_IDEX, zero_out_EX, PCSrc;
    wire Branch_ID, BranchN_ID, Jump_ID, Branch_out_IDEX, BranchN_out_IDEX, Jump_out_IDEX, Branch_out_EXMem, BranchN_out_EXMem, Jump_out_EXMem;
    wire en_IF, en_IFID, NOP_IDEX, NOP_IFID;
    
    assign PC_out_ID = PC_out_IFID;
    assign inst_ID = inst_out_IFID;
    assign MemRW_EX = MemRW_out_IDEX;
    assign MemRW_Mem = MemRW_out_EXMem;
    assign Addr_out = ALU_out_EXMem;
    assign Data_out = Rs2_out_EXMem;
    
    assign IdEx_rd = Rd_addr_out_IDEX;
    assign IdEx_rs1 = Inst_out_IDEX[19:15];
    assign IdEx_rs2 = Inst_out_IDEX[24:20];
    assign IdEx_rs1_val = Rs1_out_IDEX;
    assign IdEx_rs2_val = Rs2_out_IDEX;
    assign IdEx_alu_ctrl = ALU_control_out_IDEX;
    assign IdEx_reg_wen = RegWrite_out_IDEX;
    assign IdEx_imm = Imm_out_IDEX;
    assign IdEx_is_branch=(Branch_out_IDEX|BranchN_out_IDEX);
    assign IdEx_is_jal=Jump_out_IDEX;    
    assign IdEx_inst = Inst_out_IDEX;
    assign PC_Ex = PC_out_IDEX;

    stall u0(
        .rst_stall (rst),
        .Rs1_addr_ID (Rs1_addr_ID),                                    
        .Rs2_addr_ID (Rs2_addr_ID),                       
        .RegWrite_out_IDEX (RegWrite_out_IDEX),
        .Rd_addr_out_IDEX  (Rd_addr_out_IDEX),
        .RegWrite_out_EXMem (RegWrite_out_EXMem),
        .Rd_addr_out_EXMem  (Rd_addr_out_EXMem), 
        .Rs1_used (Rs1_used),
        .Rs2_used (Rs2_used),
        .Branch_ID (Branch_ID), 
        .BranchN_ID (BranchN_ID),  
        .Jump_ID (Jump_ID),
        .Branch_out_IDEX (Branch_out_IDEX),
        .BranchN_out_IDEX (BranchN_out_IDEX),                            
        .Jump_out_IDEX (Jump_out_IDEX),
        .Branch_out_EXMem (Branch_out_EXMem),
        .BranchN_out_EXMem (BranchN_out_EXMem),
        .Jump_out_EXMem (Jump_out_EXMem),               
        .en_IF (en_IF),
        .en_IFID (en_IFID),
        .NOP_IDEX (NOP_IDEX),
        .NOP_IFID (NOP_IFID)
    );
    Pipeline_IF u1(
        .clk_IF(clk),
        .rst_IF(rst),
        .en_IF(en_IF),
        .PC_in_IF(PC_imm_out_EXMem),
        .PCSrc(PCSrc),
        .PC_out_IF(PC_out_IF)
    );
    IF_reg_ID u2(
        .clk_IFID(clk),
        .rst_IFID(rst),
        .en_IFID(en_IFID),
        .PC_in_IFID(PC_out_IF),
        .inst_in_IFID(inst_IF),
        .NOP_IFID(NOP_IFID),
        .PC_out_IFID(PC_out_IFID),
        .inst_out_IFID(inst_out_IFID),
        .valid_IFID(valid_IFID)
    );
    Pipeline_ID u3(
        .clk_ID(clk),
        .rst_ID(rst),
        .RegWrite_in_ID(RegWrite_out_MemWB),
        .Rd_addr_ID(Rd_addr_out_MemWB),
        .Wt_data_ID(Data_out_WB),
        .Inst_in_ID(inst_out_IFID),
        .Rd_addr_out_ID(Rd_addr_out_ID),
        .Rs1_out_ID(Rs1_out_ID),
        .Rs2_out_ID(Rs2_out_ID),
        .Rs1_addr_ID(Rs1_addr_ID),
        .Rs2_addr_ID(Rs2_addr_ID),
        .Rs1_used(Rs1_used),
        .Rs2_used(Rs2_used),
        .Imm_out_ID(Imm_out_ID),
        .ALUSrc_B_ID(ALUSrc_B_ID),
        .ALU_control_ID(ALU_control_ID),
        .Branch_ID(Branch_ID),
        .BranchN_ID(BranchN_ID),
        .MemRW_ID(MemRW_ID),
        .Jump_ID(Jump_ID),
        .MemtoReg_ID(MemtoReg_ID),
        .RegWrite_out_ID(RegWrite_out_ID),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .x8(x8),
        .x9(x9),
        .x10(x10),
        .x11(x11),
        .x12(x12),
        .x13(x13),
        .x14(x14),
        .x15(x15),
        .x16(x16),
        .x17(x17),
        .x18(x18),
        .x19(x19),
        .x20(x20),
        .x21(x21),
        .x22(x22),
        .x23(x23),
        .x24(x24),
        .x25(x25),
        .x26(x26),
        .x27(x27),
        .x28(x28),
        .x29(x29),
        .x30(x30),
        .x31(x31)
    );
     ID_reg_Ex u4(
        .clk_IDEX(clk),
        .rst_IDEX(rst),
        .en_IDEX(1'b1),
        .NOP_IDEX(NOP_IDEX),
        .valid_in_IDEX(valid_IFID),
        .PC_in_IDEX(PC_out_IFID),
        .Inst_in_IDEX(inst_out_IFID),
        .Rd_addr_IDEX(Rd_addr_out_ID),
        .Rs1_in_IDEX(Rs1_out_ID),
        .Rs2_in_IDEX(Rs2_out_ID),
        .Imm_in_IDEX(Imm_out_ID),        
        .ALUSrc_B_in_IDEX(ALUSrc_B_ID),
        .ALU_control_in_IDEX(ALU_control_ID),
        .Branch_in_IDEX(Branch_ID),
        .BranchN_in_IDEX(BranchN_ID),
        .MemRW_in_IDEX(MemRW_ID),
        .Jump_in_IDEX(Jump_ID),
        .MemtoReg_in_IDEX(MemtoReg_ID),
        .RegWrite_in_IDEX(RegWrite_out_ID),
        .PC_out_IDEX(PC_out_IDEX),
        .Inst_out_IDEX(Inst_out_IDEX),
        .Rd_addr_out_IDEX(Rd_addr_out_IDEX),
        .Rs1_out_IDEX(Rs1_out_IDEX),
        .Rs2_out_IDEX(Rs2_out_IDEX),
        .Imm_out_IDEX(Imm_out_IDEX),
        .ALUSrc_B_out_IDEX(ALUSrc_B_out_IDEX),
        .ALU_control_out_IDEX(ALU_control_out_IDEX),
        .Branch_out_IDEX(Branch_out_IDEX),
        .BranchN_out_IDEX(BranchN_out_IDEX),
        .MemRW_out_IDEX(MemRW_out_IDEX),
        .Jump_out_IDEX(Jump_out_IDEX),
        .MemtoReg_out_IDEX(MemtoReg_out_IDEX),
        .RegWrite_out_IDEX(RegWrite_out_IDEX),        
        .valid_out_IDEX(valid_out_IDEX)
    );
     Pipeline_Ex u5(
        .PC_in_EX(PC_out_IDEX),
        .Rs1_in_EX(Rs1_out_IDEX),
        .Rs2_in_EX(Rs2_out_IDEX),
        .Imm_in_EX(Imm_out_IDEX),
        .ALUSrc_B_in_EX(ALUSrc_B_out_IDEX),
        .ALU_control_in_EX(ALU_control_out_IDEX),
        .PC_out_EX(PC_out_EX),
        .PC4_out_EX(PC4_out_EX),
        .zero_out_EX(zero_out_EX),
        .ALU_out_EX(ALU_out_EX),
        .Rs2_out_EX(Rs2_out_EX)
     );
    Ex_reg_Mem u6(
        .clk_EXMem(clk),
        .rst_EXMem(rst),
        .en_EXMem(1'b1),
        .PC_in_EXMem (PC_out_IDEX),
        .PC4_in_EXMem (PC4_out_EX),
        .PC_imm_EXMem (PC_out_EX),
        .valid_in_EXMem (valid_out_IDEX),
        .Inst_in_EXMem (Inst_out_IDEX),
        .Rd_addr_EXMem (Rd_addr_out_IDEX),
        .zero_in_EXMem (zero_out_EX),
        .ALU_in_EXMem (ALU_out_EX),
        .Rs2_in_EXMem (Rs2_out_EX),
        .Branch_in_EXMem (Branch_out_IDEX),
        .BranchN_in_EXMem (BranchN_out_IDEX),
        .MemRW_in_EXMem (MemRW_out_IDEX),
        .Jump_in_EXMem (Jump_out_IDEX),
        .MemtoReg_in_EXMem (MemtoReg_out_IDEX),
        .RegWrite_in_EXMem (RegWrite_out_IDEX),
        .PC_out_EXMem (PC_out_EXMem),
        .PC4_out_EXMem (PC4_out_EXMem),
        .PC_imm_out_EXMem (PC_imm_out_EXMem),
        .valid_out_EXMem (valid_out_EXMem),
        .Inst_out_EXMem (Inst_out_EXMem),
        .Rd_addr_out_EXMem (Rd_addr_out_EXMem),
        .zero_out_EXMem (zero_out_EXMem),
        .ALU_out_EXMem (ALU_out_EXMem),
        .Rs2_out_EXMem (Rs2_out_EXMem),
        .Branch_out_EXMem (Branch_out_EXMem),
        .BranchN_out_EXMem (BranchN_out_EXMem),
        .MemRW_out_EXMem (MemRW_out_EXMem),
        .Jump_out_EXMem (Jump_out_EXMem),
        .MemtoReg_out_EXMem (MemtoReg_out_EXMem),
        .RegWrite_out_EXMem (RegWrite_out_EXMem)        
    );
    Pipeline_Mem u7(
        .zero_in_Mem (zero_out_EXMem),
        .Branch_in_Mem (Branch_out_EXMem),
        .BranchN_in_Mem (BranchN_out_EXMem),
        .Jump_in_Mem (Jump_out_EXMem),
        .PCSrc (PCSrc)
    );
    Mem_reg_WB u8(
        .clk_MemWB (clk),
        .rst_MemWB (rst),
        .en_MemWB (1'b1),
        .PC4_in_MemWB (PC4_out_EXMem),
        .PC_in_MemWB (PC_out_EXMem),
        .Inst_in_MemWB (Inst_out_EXMem),
        .valid_in_MemWB (valid_out_EXMem),
        .Rd_addr_MemWB (Rd_addr_out_EXMem),
        .ALU_in_MemWB (ALU_out_EXMem),
        .Dmem_data_MemWB (Data_in),
        .MemtoReg_in_MemWB (MemtoReg_out_EXMem),
        .RegWrite_in_MemWB (RegWrite_out_EXMem),
        .PC4_out_MemWB (PC4_out_MemWB),
        .PC_out_MemWB ( ),
        .Inst_out_MemWB ( ),
        .valid_out_MemWB ( ),
        .Rd_addr_out_MemWB (Rd_addr_out_MemWB),
        .ALU_out_MemWB (ALU_out_MemWB),
        .DMem_data_out_MemWB (DMem_data_out_MemWB),
        .MemtoReg_out_MemWB (MemtoReg_out_MemWB),
        .RegWrite_out_MemWB (RegWrite_out_MemWB)
    );
    Pipeline_WB u9(
        .PC4_in_WB (PC4_out_MemWB),
        .ALU_in_WB (ALU_out_MemWB),
        .DMem_data_WB (DMem_data_out_MemWB),
        .MemtoReg_in_WB (MemtoReg_out_MemWB),
        .Data_out_WB (Data_out_WB)
    ); 

endmodule
