`timescale 1ns / 1ps

module div32(
    input   clk,
    input  rst,
    input start,
    input[31:0] dividend,                   
    input[31:0] divisor,                    
    output  [31:0] quotient,                
    output  [31:0] remainder,                
    output reg finish
    );
    
    reg[63:0] rem;
    reg[31:0] div;
    
    reg [5:0] cnt = 6'b0;
    assign quotient = rem[31:0];
    assign remainder = rem[63:32];
    
    always@(posedge clk or posedge rst or posedge start) begin
        if(rst || !start) begin
            rem <= 64'b0;
            div <= 32'b0;   
            finish <= 1'b0;
            cnt <= 0;
        end
        else if(start && !finish) begin
            if(cnt == 0) begin
                rem <= {32'b0 , dividend};
                div <= divisor;
                finish <= 1'b0;
                cnt <= 1;
            end
            else if(cnt <= 33) begin
                if(rem[63:32] < div) begin
                    rem <= rem << 1;
                end
                else if(rem[63:32] >= div) begin
                    rem <= ({(rem[63:32] - div),rem[31:0]} << 1) + 1'b1;
                end
                cnt <= cnt + 1;
            end
            else begin
                rem[63:32] <= rem[63:32] >> 1;
                finish <= 1'b1;
            end
        end
    end
endmodule
