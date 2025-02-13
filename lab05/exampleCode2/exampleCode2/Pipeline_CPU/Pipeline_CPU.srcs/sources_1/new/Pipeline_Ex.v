`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 16:05:47
// Design Name: 
// Module Name: Pipeline_Ex
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


module Pipeline_Ex(
    input[31:0] PC_in_EX, //PC输入
    input[31:0] Rs1_in_EX, //操作数1输入
    input[31:0] Rs2_in_EX, //操作数2输入
    input[31:0] Imm_in_EX, //立即数输入
    input ALUSrc_B_in_EX, //ALU B选择
    input[2:0] ALU_control_in_EX, //ALU选择控制
    output reg [31:0] PC_out_EX, //PC输出
    output reg [31:0] PC4_out_EX, //PC+4输出
    output wire zero_out_EX, //ALU判0输出
    output wire [31:0] ALU_out_EX, //ALU计算输出
    output reg [31:0] Rs2_out_EX //操作数2输出
    );
    wire [31:0]o_out;
    assign o_out = ALUSrc_B_in_EX? Imm_in_EX: Rs2_in_EX;
    always @(*)begin
        PC4_out_EX = PC_in_EX + 32'h00000004;
        PC_out_EX = PC_in_EX + Imm_in_EX;
        Rs2_out_EX = Rs2_in_EX;
    end
    
    ALU ALU_0(
        .A(Rs1_in_EX),
        .B(o_out),
        .ALU_operation(ALU_control_in_EX),
        .res(ALU_out_EX),
        .zero(zero_out_EX)
    );
endmodule
