`timescale 1ns / 1ps

module Datapath_more(
    input wire clk,
    input wire rst,
    input wire[31:0] inst_field,
    input wire[31:0] Data_in,
    input wire[3:0] ALU_operation,
    input wire[2:0] ImmSel,
    input wire[1:0] MemtoReg,
    input wire ALUSrc_B,
    input wire [1:0] Jump,
    input wire Branch,  // beq
    input wire BranchN, // bne
    input wire RegWrite,

    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] ALU_out,
    output wire[1023:0] all_regs_data
    );

    wire[31:0] Imm_out;
    wire[31:0] PC_inc;
    wire[31:0] PC_imm;
    wire ALU_zero;
    wire[31:0] PC_1;
    wire[31:0] Wt_data;
    wire[31:0] PC_new;
    wire[31:0] Rs1_data;
    wire[31:0] ALU_B;

    ImmGen_more ImmGen(
        .ImmSel(ImmSel),
        .inst_field(inst_field),
        .Imm_out(Imm_out)
    );

    add32 add_32_0(
        .a(32'h4),
        .b(PC_out),
        .c(PC_inc)
    );

    add32 add_32_1(
        .a(PC_out),
        .b(Imm_out),
        .c(PC_imm)
    );

    MUX2T1_32 MUX2T1_32_1(
        .I0(PC_inc),
        .I1(PC_imm),
        .s((Branch & ALU_zero) | (BranchN & ~ALU_zero)),
        .o(PC_1)
    );

    MUX4T1_32 MUX4T1_32_0(
        .s(MemtoReg),
        .I0(ALU_out),
        .I1(Data_in),
        .I2(PC_inc),
        .I3(Imm_out),
        .o(Wt_data)
    );

    MUX4T1_32 MUX4T1_32_1(
        .I0(PC_1),
        .I1(PC_imm),
        .I2(ALU_out),
        .I3(PC_1),
        .s(Jump),
        .o(PC_new)
    );

    MUX2T1_32 MUX2T1_32_0(
        .I0(Data_out),
        .I1(Imm_out),
        .s(ALUSrc_B),
        .o(ALU_B)
    );

    wire [4:0]rs1addr;
    assign rs1addr = inst_field[19:15];
    wire [4:0]rs2addr;
    assign rs2addr = inst_field[24:20];
    wire [4:0]wtaddr;
    assign wtaddr = inst_field[11:7]; 

    Regs Regs(
        .clk(clk),
        .rst(rst),
        .RegWrite(RegWrite),
        .Rs1_addr(rs1addr),
        .Rs2_addr(rs2addr),
        .Wt_addr(wtaddr),
        .Wt_data(Wt_data),
        .Rs1_data(Rs1_data),
        .Rs2_data(Data_out),
        .all_regs_data(all_regs_data)
    );

    ALU ALU(
        .A(Rs1_data),
        .B(ALU_B),
        .ALU_operation(ALU_operation),
        .res(ALU_out),
        .zero(ALU_zero)
    );

    REG32 PC(
        .clk(clk),
        .rst(rst),
        .CE(1'b1),
        .D(PC_new),
        .Q(PC_out)
    );
    
endmodule
