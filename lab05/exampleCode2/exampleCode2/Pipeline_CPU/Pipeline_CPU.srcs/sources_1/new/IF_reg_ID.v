`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 10:00:52
// Design Name: 
// Module Name: IF_reg_ID
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


module IF_reg_ID(
    input clk_IFID, //�Ĵ���ʱ��
    input rst_IFID, //�Ĵ�����λ
    input en_IFID, //�Ĵ���ʹ��
    input [31:0] PC_in_IFID, //PC����
    input [31:0] inst_in_IFID, //ָ������
    input NOP_IFID, //����NOPʹ��
    output reg [31:0] PC_out_IFID, //PC���
    output reg [31:0] inst_out_IFID, //ָ�����
    output reg valid_IFID //�Ĵ�����Ч
    );
    always @(posedge clk_IFID or posedge rst_IFID ) begin
        if(rst_IFID==1'b1) begin
            PC_out_IFID<=32'h00000000;
            inst_out_IFID<=32'h00000000;
            valid_IFID<=1'b1;
        end
        else if (NOP_IFID) begin
            PC_out_IFID <= 32'h00000000;
            inst_out_IFID <= 32'h00000013;
            valid_IFID <= 1'b0;
        end
        else if(en_IFID) begin
            PC_out_IFID<=PC_in_IFID;
            inst_out_IFID<=inst_in_IFID;
            valid_IFID<=1'b1;
        end
    end

endmodule
