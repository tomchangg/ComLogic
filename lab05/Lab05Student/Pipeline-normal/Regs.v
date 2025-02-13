`timescale 1ns / 1ps

module Regs(
        input clk,
        input rst,
        input [4:0] Rs1_addr, 
        input [4:0] Rs2_addr, 
        input [4:0] Wt_addr, 
        input [31:0]Wt_data, 
        input RegWrite, 
        output [31:0] Rs1_data, 
        output [31:0] Rs2_data,
        output [1023:0] all_regs_data
    );
    reg [31:0] register [1:31]; 
    integer i;

    assign Rs1_data = (Rs1_addr== 0) ? 0 : register[Rs1_addr]; 
    assign Rs2_data = (Rs2_addr== 0) ? 0 : register[Rs2_addr]; 

    always @(posedge clk or posedge rst) begin 
        if (rst==1) 
            for (i=1; i<32; i=i+1) 
                register[i] <= 0; 
        else if ((Wt_addr != 0) && (RegWrite == 1)) 
            register[Wt_addr] <= Wt_data; 
    end

        assign all_regs_data = {register[31], register[30], register[29], register[28], 
                            register[27], register[26], register[25], register[24],
                            register[23], register[22], register[21], register[20],
                            register[19], register[18], register[17], register[16],
                            register[15], register[14], register[13], register[12],
                            register[11], register[10], register[9], register[8],
                            register[7], register[6], register[5], register[4],
                            register[3], register[2], register[1], 32'h0};  // Rs0默认为0
endmodule