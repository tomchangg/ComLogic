`timescale 1ns / 1ps
module regs(
    input clk,
    input rst,
    input RegWrite,
    input [4:0] Rs1_addr, Rs2_addr, Wt_addr,
    input [31:0] Wt_data,
    output [31:0] Rs1_data, Rs2_data,
    output [1023:0] all_regs_data // use for VGA
);
    reg [31:0] register [1:31]; // r1 - r31
    integer i;

    // 寄存器读出
    assign Rs1_data = (Rs1_addr == 0) ? 0 : register[Rs1_addr];
    assign Rs2_data = (Rs2_addr == 0) ? 0 : register[Rs2_addr];

    // 寄存器写入及重置
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            for (i = 1; i < 32; i = i + 1)
                register[i] <= 0; // 重置所有寄存器
        end else if ((Wt_addr != 0) && (RegWrite == 1)) begin
            register[Wt_addr] <= Wt_data; // 写入数据到指定寄存器
        end
    end

    // 将所有寄存器打包成1024位的regfile输出
    assign all_regs_data = {register[31], register[30], register[29], register[28], 
                  register[27], register[26], register[25], register[24],
                  register[23], register[22], register[21], register[20],
                  register[19], register[18], register[17], register[16],
                  register[15], register[14], register[13], register[12],
                  register[11], register[10], register[9], register[8],
                  register[7], register[6], register[5], register[4],
                  register[3], register[2], register[1], 32'b0};


endmodule


