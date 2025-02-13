`timescale 1ns / 1ps

module Pipeline_ID(
    input clk_ID,
    input rst_ID,
    input RegWrite_in_ID,
    input [4:0]Rd_addr_ID,
    input [31:0]Wt_data_ID,
    input [31:0]Inst_in_ID,

    output [4:0]Rd_addr_out_ID,
    output [31:0]Rs1_out_ID,
    output [31:0]Rs2_out_ID,
    output [4:0]Rs1_addr_ID,
    output [4:0]Rs2_addr_ID,
    output Rs1_used,
    output Rs2_used,

    output [31:0]Imm_out_ID,
    output ALUSrc_B_ID,
    output [3:0]ALU_control_ID,
    output Branch_ID,
    output BranchN_ID,
    output MemRW_ID,
    output [1:0]Jump_ID,
    output [1:0]MemtoReg_ID,
    output RegWrite_out_ID,
    output [1023:0] all_regs_data
    );
    
    wire[2:0] ImmSel;
    assign Rd_addr_out_ID = Inst_in_ID[11:7];
    assign Rs1_addr_ID = Inst_in_ID[19:15];
    assign Rs2_addr_ID = Inst_in_ID[24:20];
    assign Rs1_used = (Inst_in_ID[6:0] == 7'b0110011) || // R-type 指令 (例如加法、减法)
                  (Inst_in_ID[6:0] == 7'b0000011) || // I-type 指令（加载指令）
                  (Inst_in_ID[6:0] == 7'b1100011);  // B-type 指令（分支指令）

    assign Rs2_used = (Inst_in_ID[6:0] == 7'b0110011) || // R-type 指令
                  (Inst_in_ID[6:0] == 7'b0100011) || // S-type 指令（存储指令）
                  (Inst_in_ID[6:0] == 7'b1100011);  // B-type 指令

    Regs Regs_0(
        .clk(~clk_ID),  // SIGNIFICANT!
        .rst(rst_ID),
        .Rs1_addr(Inst_in_ID[19:15]),
        .Rs2_addr(Inst_in_ID[24:20]),
        .Wt_addr(Rd_addr_ID),
        .Wt_data(Wt_data_ID),
        .RegWrite(RegWrite_in_ID),
        .Rs1_data(Rs1_out_ID),
        .Rs2_data(Rs2_out_ID),
        .all_regs_data(all_regs_data)
    );

    ImmGen_more ImmGen_0(
        .ImmSel(ImmSel),
        .inst_field(Inst_in_ID),
        .Imm_out(Imm_out_ID)
    );

    SCPU_ctrl_more SCPU_ctrl_0(
        .OPcode(Inst_in_ID[6:2]),
        .Fun3(Inst_in_ID[14:12]),
        .Fun7(Inst_in_ID[30]),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B_ID),
        .MemtoReg(MemtoReg_ID),
        .Jump(Jump_ID),
        .Branch(Branch_ID),
        .BranchN(BranchN_ID),
        .RegWrite(RegWrite_out_ID),
        .MemRW(MemRW_ID),
        .ALU_Control(ALU_control_ID)
    );
endmodule
