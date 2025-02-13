`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 15:36:21
// Design Name: 
// Module Name: Ex_reg_Mem
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


module Ex_reg_Mem( 
    input clk_EXMem, //寄存器时钟
    input rst_EXMem, //寄存器复位
    input en_EXMem, //寄存器使能
    input[31:0] PC_imm_EXMem, //PC+imm输入
    input[31:0] PC_in_EXMem, //PC输入
    input[31:0] PC4_in_EXMem, //PC+4输入
    input valid_in_EXMem, //有效
    input[31:0] Inst_in_EXMem, //指令输入
    input [4:0] Rd_addr_EXMem, //写目的寄存器地址输入
    input zero_in_EXMem, //zero
    input[31:0] ALU_in_EXMem, //ALU输入
    input[31:0] Rs2_in_EXMem, //操作数2输入
    input Branch_in_EXMem, //beq
    input BranchN_in_EXMem, //bne
    input MemRW_in_EXMem, //存储器读写
    input Jump_in_EXMem, //Jal
    input [1:0] MemtoReg_in_EXMem, //写回
    input RegWrite_in_EXMem, //寄存器堆读写

    output reg[31:0] PC_imm_out_EXMem, //PC+imm输出
    output reg[31:0] PC_out_EXMem, //PC输出
    output reg[31:0] PC4_out_EXMem, //PC+4输出
    output reg valid_out_EXMem, //有效输出
    output reg[31:0] Inst_out_EXMem, //指令输出
    output reg[4:0] Rd_addr_out_EXMem, //写目的寄存器输出
    output reg zero_out_EXMem,  //zero
    output reg[31:0] ALU_out_EXMem, //ALU输出
    output reg[31:0] Rs2_out_EXMem, //操作数2输出
    output reg Branch_out_EXMem, //Beq
    output reg BranchN_out_EXMem, //Bne
    output reg MemRW_out_EXMem, //存储器读写
    output reg Jump_out_EXMem, //Jal
    output reg [1:0]MemtoReg_out_EXMem, //写回
    output reg RegWrite_out_EXMem  //寄存器堆读写
); 
always @(posedge clk_EXMem or posedge rst_EXMem) begin
    if(rst_EXMem) begin
        PC_out_EXMem<=0;   
        PC4_out_EXMem<=0;
        Rd_addr_out_EXMem<=0;
        zero_out_EXMem<=0;        
        ALU_out_EXMem<=0;  
        Rs2_out_EXMem<=0; 
        Branch_out_EXMem<=0;       
        BranchN_out_EXMem<=0;       
        MemRW_out_EXMem<=0;      
        Jump_out_EXMem<=0;     
        MemtoReg_out_EXMem<=0;      
        RegWrite_out_EXMem<=0;
        Inst_out_EXMem<=0;
        PC_imm_out_EXMem<=0;
        valid_out_EXMem<=1'b1;
    end
    else if(valid_in_EXMem==1'b0) begin
        PC_out_EXMem<=0;   
        PC4_out_EXMem<=0;
        Rd_addr_out_EXMem<=0;
        zero_out_EXMem<=0;        
        ALU_out_EXMem<=0;  
        Rs2_out_EXMem<=0; 
        Branch_out_EXMem<=0;       
        BranchN_out_EXMem<=0;       
        MemRW_out_EXMem<=0;      
        Jump_out_EXMem<=0;     
        MemtoReg_out_EXMem<=0;      
        RegWrite_out_EXMem<=0;
        Inst_out_EXMem<=32'h0000_0013;
        PC_imm_out_EXMem<=0;
        valid_out_EXMem<=1'b0;       
    end
    else if(en_EXMem) begin
        PC_out_EXMem<=PC_in_EXMem;   
        PC4_out_EXMem<=PC4_in_EXMem;
        Rd_addr_out_EXMem<=Rd_addr_EXMem;
        zero_out_EXMem<=zero_in_EXMem;        
        ALU_out_EXMem<=ALU_in_EXMem;  
        Rs2_out_EXMem= Rs2_in_EXMem;
        Branch_out_EXMem<=Branch_in_EXMem;       
        BranchN_out_EXMem<=BranchN_in_EXMem;
        MemRW_out_EXMem<=MemRW_in_EXMem;           
        Jump_out_EXMem<=Jump_in_EXMem;     
        MemtoReg_out_EXMem<=MemtoReg_in_EXMem;      
        RegWrite_out_EXMem<=RegWrite_in_EXMem;
        Inst_out_EXMem<=Inst_in_EXMem;
        PC_imm_out_EXMem<=PC_imm_EXMem;
        valid_out_EXMem<=valid_in_EXMem;        
    end
end 
endmodule
