`timescale 1ns / 1ps

module RV_int(
    input wire clk ,
    input wire reset , 
    input wire INT,
    input wire ecall ,
    input wire mret,
    input wire ill_instr,
    input wire [31:0] pc_next,
    output reg [31:0] pc,
    output reg [31:0] MEPC
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            MEPC <= 32'h00000000;// 复位时清除MEPC
        end
        else if (INT | ecall | ill_instr) begin
            MEPC <= pc_next;// 中断发生时，保存下一条指令的地址
        end
    end

    always @(*) begin
        if (reset) begin
            pc = 32'h00000000;
        end
        else if (INT) begin
            pc = 32'h0000000c;     // 跳转到中断处理入口
        end
        else if (ecall) begin
            pc = 32'h00000008;     // 跳转到ecall处理入口
        end
        else if (ill_instr) begin
            pc = 32'h00000004;     // 跳转到非法指令处理入口
        end
        else if (mret) begin
            pc = MEPC;             // 执行mret时恢复到MEPC保存的下一条指令
        end
        else begin        // 如果没有异常，正常更新MEPC
            pc = pc_next;          
        end
    end
endmodule


