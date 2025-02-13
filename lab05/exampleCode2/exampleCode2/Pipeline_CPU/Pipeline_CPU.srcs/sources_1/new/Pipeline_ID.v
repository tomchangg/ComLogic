`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 10:36:29
// Design Name: 
// Module Name: Pipeline_ID
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


module Pipeline_ID(
    input clk_ID, //时钟
    input rst_ID, //复位
    input RegWrite_in_ID, //寄存器堆使能
    input [4:0] Rd_addr_ID, //写目的地址输入
    input [31:0] Wt_data_ID, //写数据输入
    input [31:0] Inst_in_ID, //指令输入
    output [4:0] Rd_addr_out_ID, //写目的地址输出
    output wire [31:0] Rs1_out_ID, //操作数1输出
    output wire [31:0] Rs2_out_ID, //操作数2输出
    output wire [4:0] Rs1_addr_ID, //寄存器地址1
    output wire [4:0] Rs2_addr_ID, //寄存器地址2
    output wire Rs1_used, //Rs1是否被使用
    output wire Rs2_used, //Rs2是否被使用
    output wire [31:0] Imm_out_ID, //立即数输出
    output wire ALUSrc_B_ID, //ALU B端输入选择
    output wire [2:0] ALU_control_ID, //ALU控制
    output wire Branch_ID, //Beq控制
    output wire BranchN_ID, //Bne控制
    output wire MemRW_ID, //存储器读写
    output wire [1:0] Jump_ID, //Jal控制
    output wire [1:0] MemtoReg_ID, //寄存器写回选择
    output wire RegWrite_out_ID, //寄存器堆读写    
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
    output [31:0]x31
    );
    assign Rd_addr_out_ID = Inst_in_ID[11:7];    
    assign Rs1_addr_ID = Inst_in_ID[19:15];
    assign Rs2_addr_ID = Inst_in_ID[24:20];
    
    
    wire [1:0]ImmSel_out;
    
    Regs Regs_0(
        .clk(~clk_ID),
        .rst(rst_ID),
        .Rs1_addr(Inst_in_ID[19:15]),
        .Rs2_addr (Inst_in_ID[24:20]),
        .Wt_addr (Rd_addr_ID),
        .Wt_data (Wt_data_ID),
        .RegWrite (RegWrite_in_ID),
        .Rs1_data (Rs1_out_ID),
        .Rs2_data (Rs2_out_ID),
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
    ImmGen ImmGen_0(
        .ImmSel(ImmSel_out),
        .Inst_field(Inst_in_ID),
        .Imm_out(Imm_out_ID)
    );
    SCPU_ctrl ctrl_0(
        .OPcode(Inst_in_ID[6:2]),
        .Fun3(Inst_in_ID[14:12]),
        .Fun7(Inst_in_ID[30]),
        .ImmSel(ImmSel_out),
        .ALUSrc_B(ALUSrc_B_ID),
        .MemtoReg(MemtoReg_ID),
        .Jump(Jump_ID),
        .Branch(Branch_ID),
        .BranchN(BranchN_ID),
        .RegWrite(RegWrite_out_ID),
        .MemRW(MemRW_ID),
        .ALU_Control(ALU_control_ID),
        .Rs1_used(Rs1_used),
        .Rs2_used(Rs2_used)
    );
    
endmodule
