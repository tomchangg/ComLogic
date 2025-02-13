`timescale 1ns / 1ps
module Cache_tb();
    reg clk;
	reg rst;
	reg [31:0] addr_cpu;
	reg rd_cpu;
	reg wr_cpu;
	reg ready_mem;

	// Outputs
	wire [31:0] addr_mem;
	wire rd_mem;
	wire wr_mem;

	// Bidirs
	reg [31:0] data_cpu_write;
	reg [127:0] data_mem_read;
	wire [127:0] data_mem_write;
	wire [31:0] data_cpu_read;
	
	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.clk(clk), 
		.rst(rst), 
		.data_cpu_write(data_cpu_write), 
		.data_mem_read(data_mem_read), 
		.addr_cpu(addr_cpu), 
		.addr_mem(addr_mem), 
		.rd_cpu(rd_cpu), 
		.wr_cpu(wr_cpu), 
		.rd_mem(rd_mem), 
		.wr_mem(wr_mem), 
		.data_cpu_read(data_cpu_read), 
		.data_mem_write(data_mem_write),
		.ready_mem(ready_mem)
	);

	//Clock generator block
	initial begin
	    clk = 1'd0;
	forever
	    #10 clk = ~clk;
	end			
	
	initial begin
		// Initialize Inputs
		rst = 1;
		addr_cpu = 0;
		rd_cpu = 0;
		wr_cpu = 0;
		ready_mem = 1;
		data_cpu_write = 0;
		data_mem_read = 0;
        
		rst = 0;

        #120;
		
		//  Read from location
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
		#40;
		rd_cpu = 1'd0;
		
		//  Write to same location
        #40;
		wr_cpu = 1'd1;
		data_cpu_write = 32'habababab;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
        #40;
		wr_cpu = 1'd0;
		// Read from same location to check updated data
        #40;
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_0111;
		#40;
		rd_cpu = 1'd0;
		
// //		 Read Miss with dirty bit 0 policy check, reads data from Main Memory
		
		#40;
		rd_cpu = 1'd1;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1010; // read miss
		#40;
	
		ready_mem = 1;		
		data_mem_read = 128'h54088666_54088666_54088666_54088666; // miss

		#40;
		rd_cpu = 1'd0;
		#40;	
		rd_cpu = 1'd1;
        addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1010;
		#40;
		rd_cpu = 1'd0;
 		

// //////////////////////////////////////////////////////
// 		//  write Miss with dirty bit 0 policy check
		#80;
		rd_cpu = 1'd0;
		wr_cpu = 1'd1;
		data_cpu_write = 32'h5a5a5a5a;
		addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1101;
		#40;
		
		ready_mem = 1;
		data_mem_read = 128'h11451450_11451451_11451452_11451453;

		#40;

        data_cpu_write = 32'h5a5a5a5a;
        addr_cpu = 32'b0000_0000_0000_0000_0000_0010_0000_1101;
		#40;
		wr_cpu = 1'd0;
                           
 		#300 $finish;
	end
    
endmodule
