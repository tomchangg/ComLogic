`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/26 23:40:10
// Design Name: 
// Module Name: floatadd_tb
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


module floatadd_tb;

	reg clk;
	reg rst;
	reg [31:0] A;
	reg [31:0] B;
	reg en;
    
	wire [31:0] result;
	wire fin;

	floatadd add (
		.clk(clk), 
		.rst(rst), 
		.A(A), 
		.B(B), 
		.en(en), 
		.result(result), 
		.fin(fin)
	);
	
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		A = 32'hc0000000; 
        B = 32'hc0000000; 
        en = 0;

		#10;
		rst = 1; 
		A = 32'hc0a00000; //-5.0
		B = 32'hc0900000; //-4.5
		en = 1;           // c1180000 (-9.5)
		rst = 0;
		#100;		
		A = 32'h40a00000; //+5.0
		B = 32'h40900000; //+4.5
		en = 1;           //41180000 (+9.5)
		rst = 0;
		#100;
		A = 32'h7f7fffff;  // 接近最大正数 (3.4028235 × 10^38)
		B = 32'h7f7fffff;  // 接近最大正数 (3.4028235 × 10^38)
		en = 1;
		rst = 0;
		#160
        en = 0;           
		rst = 1; 
		$stop();
	end
endmodule
