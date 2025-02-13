`timescale 1ns / 1ps

module CPU_test(
	input clk,
	input rst
    );
	
	wire [31:0] Data_in, inst_IF, Addr_out, Data_out, PC_out_IF, PC_out_ID, PC_out_EX, Data_out_WB, inst_ID;
	wire MemRW_EX, MemRW_Mem;
	wire [1023:0]all_regs_data;
	
	PipelineCPU U1(
		.clk(clk),
		.rst(rst),
		.Data_in(Data_in),
		.inst_IF(inst_IF),
		.PC_out_IF(PC_out_IF),
		.PC_out_ID(PC_out_ID),
		.inst_ID(inst_ID),
		.PC_out_IDEX(PC_out_EX),
		.MemRW_EX(MemRW_EX),
		.MemRW_Mem(MemRW_Mem),
		.Addr_out(Addr_out),
		.Data_out(Data_out),
		.Data_out_WB(Data_out_WB),
		.all_regs_data(all_regs_data)
		);
	
	Rom_D_0 U2(
		.a(PC_out_IF[11:2]),
		.spo(inst_IF)
		);
		
	RAM_B U3(
		.addra(Addr_out[11:2]),
		.clka(~clk),
		.dina(Data_out),
		.douta(Data_in),
		.wea(MemRW_Mem)
		);
	
endmodule