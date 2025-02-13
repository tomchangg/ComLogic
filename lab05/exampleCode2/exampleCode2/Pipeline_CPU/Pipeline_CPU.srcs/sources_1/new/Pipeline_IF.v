`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 09:47:23
// Design Name: 
// Module Name: Pipeline_IF
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


module Pipeline_IF(
    input clk_IF, // 时钟
    input rst_IF, //复位
    input en_IF, //使能
    input [31:0]PC_in_IF, //取指令PC输入
    input PCSrc, //PC输入选择
    output wire [31:0]PC_out_IF
    );
    wire[31:0] o_out, c_out, Q_out;
    assign PC_out_IF = Q_out;
    
    MUX2T1_32 U1(
        .I0(c_out),
        .I1(PC_in_IF),
        .s(PCSrc),
        .o(o_out)
    );
    REG32 U2(
        .clk(clk_IF),
        .rst(rst_IF),
        .CE(en_IF),
        .D(o_out),
        .Q(Q_out)
    );
    add_32 U3(
        .a(32'h4),
        .b(Q_out),
        .c(c_out)
    );
    
endmodule
