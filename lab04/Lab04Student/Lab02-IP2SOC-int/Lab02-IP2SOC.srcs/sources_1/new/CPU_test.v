`timescale 1ns / 1ps

module CPU_test(
	input clk,
	input rst
	);
	
	wire [31:0] PC_out,Data_in,inst_in,Addr_out,Data_out;
	wire MemRW;
	
	SOC_int U1(
		.Addr_out(Addr_out),
		.Data_in(Data_in),
		.MIO_ready(1'b0),
		.MemRW(MemRW),
		.PC_out(PC_out),
		.clk(clk),
		.rst(rst),
		.inst_in(inst_in)
		);
		
	Rom_D_0 ROM(
		.a(PC_out[11:2]),
		.spo(inst_in)
		);
		
	RAM_B RAM(
		.addra(Addr_out[11:2]),
		.clka(~clk),
		.dina(Data_out),
		.douta(Data_in),
		.wea(MemRW)
		);
	
	
	
	
endmodule
