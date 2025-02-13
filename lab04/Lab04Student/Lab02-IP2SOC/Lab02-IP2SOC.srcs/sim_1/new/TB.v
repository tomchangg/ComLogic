`timescale 1ns / 1ps

module TB();
reg clk;
reg rst;

CPU_test CPU_test_UUT(
	.clk(clk),
	.rst(rst)
	);

always #5 clk = ~clk;

initial begin
	clk = 0;
	rst = 1;
	#1
	rst = 0;
end
    
endmodule
