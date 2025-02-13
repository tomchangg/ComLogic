`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/15 21:35:43
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input [1:0] ImmSel, //立即数操作控制
    input [31:0] Inst_field, //指令数据域[31:7]
    output reg[31:0] Imm_out //立即数输出
    );
    
    always@(*)begin
         case(ImmSel)
         2'b00:Imm_out={{20{Inst_field[31]}},Inst_field[31:20]}; //addi\lw(I)
         2'b01:Imm_out={{20{Inst_field[31]}},Inst_field[31:25],Inst_field[11:7]}; //sw(s)
         2'b10:Imm_out={{19{Inst_field[31]}},Inst_field[31],Inst_field[7],Inst_field[30:25],Inst_field[11:8],1'b0}; //beq(b)
         2'b11:Imm_out={{12{Inst_field[31]}},Inst_field[19:12],Inst_field[20],Inst_field[30:21],1'b0}; //jal(j)
         endcase
    end
    
endmodule
