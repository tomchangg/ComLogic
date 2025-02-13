`timescale 1ns / 1ps

module stall(
    input rst_stall, //复位
    input RegWrite_out_IDEX, //执行阶段寄存器写控制
    input [4:0]Rd_addr_out_IDEX, //执行阶段寄存器写地址
    input RegWrite_out_EXMem, //访存阶段寄存器写控制
    input [4:0]Rd_addr_out_EXMem, //访存阶段寄存器写地址
    input [4:0]Rs1_addr_ID, //译码阶段寄存器读地址1
    input [4:0]Rs2_addr_ID, //译码阶段寄存器读地址2
    input Rs1_used, //Rs1被使用
    input Rs2_used, //Rs2被使用
    input Branch_ID, //译码阶段beq
    input BranchN_ID, //译码阶段bne
    input [1:0]Jump_ID, //译码阶段jal
    input Branch_out_IDEX, //执行阶段beq
    input BranchN_out_IDEX, //执行阶段bne
    input [1:0]Jump_out_IDEX, //执行阶段jal
    input Branch_out_EXMem, //访存阶段beq
    input BranchN_out_EXMem, //访存阶段bne
    input [1:0]Jump_out_EXMem,

    output reg en_IF, //流水线寄存器的使能及NOP信号
    output reg en_IFID,
    output reg NOP_IFID,
    output reg NOP_IDEX
    );

    reg Data_stall, Control_stall;

    always@(*) begin
        if(rst_stall) begin
            en_IF = 1;
            en_IFID = 1;
            NOP_IFID = 0;
            NOP_IDEX = 0;
        end

        if ((Rs1_used && (Rs1_addr_ID == Rd_addr_out_IDEX) && (Rs1_addr_ID != 5'h0) && RegWrite_out_IDEX) ||
            (Rs2_used && (Rs2_addr_ID == Rd_addr_out_IDEX) && (Rs2_addr_ID != 5'h0) && RegWrite_out_IDEX) ||
            (Rs1_used && (Rs1_addr_ID == Rd_addr_out_EXMem) && (Rs1_addr_ID != 5'h0) && RegWrite_out_EXMem) ||
            (Rs2_used && (Rs2_addr_ID == Rd_addr_out_EXMem) && (Rs2_addr_ID != 5'h0) && RegWrite_out_EXMem)) 
            begin
                Data_stall = 1'b1;
            end
        else
            Data_stall = 1'b0; 

        if ((Branch_ID || BranchN_ID || Jump_ID != 2'b00) ||
            (Branch_out_IDEX || BranchN_out_IDEX || Jump_out_IDEX != 2'b00) ||
            (Branch_out_EXMem || BranchN_out_EXMem || Jump_out_EXMem != 2'b00)) begin   
                Control_stall = 1'b1;
            end
        else
            Control_stall = 1'b0;

        if (Data_stall == 1'b1) begin
            en_IF = 0;
            en_IFID = 0;
            NOP_IDEX = 1;  
        end
        else begin
            en_IF = 1;
            en_IFID = 1;
            NOP_IDEX = 0;
        end

        if (Control_stall == 1'b1)
            NOP_IFID = 1;
        else
            NOP_IFID = 0;
    end

	// wire dataHazard, controlHazard;
	
	// assign dataHazard = 
	// 	((RegWrite_out_EXMem && Rs1_used) && (Rs1_addr_ID != 5'b00000) && (Rd_addr_out_EXMem == Rs1_addr_ID)) ||
	// 	((RegWrite_out_EXMem && Rs2_used) && (Rs2_addr_ID != 5'b00000) && (Rd_addr_out_EXMem == Rs2_addr_ID)) ||
	// 	((RegWrite_out_IDEX && Rs1_used) && (Rs1_addr_ID != 5'b00000) && (Rd_addr_out_IDEX == Rs1_addr_ID)) ||
	// 	((RegWrite_out_IDEX && Rs2_used) && (Rs2_addr_ID != 5'b00000) && (Rd_addr_out_IDEX == Rs2_addr_ID));
		
	// assign controlHazard = 
	// 	Branch_ID || BranchN_ID || Jump_ID[0] || Branch_out_IDEX || BranchN_out_IDEX ||
	// 	Jump_out_IDEX[0] || Branch_out_EXMem || BranchN_out_EXMem || Jump_out_EXMem[0];	
		
	// // assign en_IF = (~dataHazard)&&(~controlHazard);
	// // assign en_IFID = (~dataHazard)&&(~controlHazard);

    // assign en_IF = (~dataHazard);
	// assign en_IFID = (~dataHazard);
	
	// assign NOP_IDEX = dataHazard ;
	// assign NOP_IFID = controlHazard;
endmodule
