`timescale 1ns / 1ps

module floatadd(
    input clk,
    input rst,
    input en, 
    input[31:0] A,
    input[31:0] B,
    output [31:0] result, 
    output reg fin
    );

    reg signa,signb,sign,sign_compare;
    reg[7:0]expa,expb;
    reg[22:0]fraca,fracb;
    reg[7:0]exp,exp_dis;
    reg[24:0]fra_max,fra_min,fra_round;
    reg[24:0]frac;
    reg[31:0]res;
    reg[2:0]state;

    wire round;
    assign result = res;
    assign round = fra_round[0];

    initial begin
        sign = 0;
        frac = 0;
        exp = 0;
    end
    
    always @(posedge clk) begin
        case(state)
        3'b000: begin
            fin <= 0;
            signa <= A[31];
            signb <= B[31];
            expa <= A[30:23];
            expb <= B[30:23];
            fraca <= A[22:0];
            fracb <= B[22:0];
            state <= 3'b001;
        end
        3'b001: begin
            if(A == 0) begin
                sign <= signb;
                exp <= expb;
                frac = fracb;
                state <= 3'b110;
            end
            else if(B == 0) begin
                sign <= signa;
                exp <= expa;
                frac = fraca;
                state <= 3'b110;
            end
            else
                state <= 3'b010;
        end
        3'b010:begin
            if(signa != signb)
                sign_compare <= 0;
            else
                sign_compare <= 1;

            if(expa > expb) begin
                exp <= expa;
                sign <= signa;
                exp_dis <= expa-expb;
                fra_max <= {2'b01, fraca};
                fra_min <= {2'b01, fracb};
            end
            else if(expa < expb) begin
                exp <= expb;
                sign <= signb;
                exp_dis <= expb-expa;
                fra_max <= {2'b01, fracb};
                fra_min <= {2'b01, fraca};
            end
            else begin
                exp <= expa;
                sign <= signa;
                exp_dis <= 0;
                if(fraca > fracb) begin
                    fra_max <= {2'b01, fraca};
                    fra_min <= {2'b01, fracb};
                end
                else begin
                    fra_max <= {2'b01, fracb};
                    fra_min <= {2'b01, fraca};
                end
            end
            state <= 3'b011;
        end
        3'b011: begin
            fra_min <= fra_min >> exp_dis;
            fra_round <= fra_min >> (exp_dis-1);
            state <= 3'b100;   // 规范化 + 舍入位
        end
        3'b100: begin
            if(sign_compare)  //舍入
                frac <= fra_max + fra_min + round;
            else
                frac <= fra_max - fra_min - round;
            state <= 3'b101;
        end
        3'b101: begin
            if(frac[24] == 1'b1) begin
                exp <= exp + 1;
                frac <= frac >> 1;
            end
            else if(frac[24:23] == 2'b00) begin
                while(frac[24:23] == 2'b00) begin
                    exp <= exp-1;
                    frac <= frac << 1;
                end
            end
            state <= 3'b110;
        end
        3'b110:begin
            fin <= 1;
            if({signa,expa,fraca} != A || {signb,expb,fracb} != B) begin
                state <= 3'b000;
            end
        end
        default: state <= 3'b000;
        endcase
    end
    
    always @(posedge fin or posedge rst) begin
        if(en && fin) begin
            if (exp >= 8'b11111111) begin
                res <= {sign, 8'b11111111, 23'b0};  // 无穷大
            end
            else if (exp <= 8'b00000000) begin
                res <= {sign, 8'b00000000, 23'b0};  // 输出零
            end
            else begin
                res <= {sign, exp, frac[22:0]};
            end
        end
        if(rst) begin
            res <= 0;
            sign <= 1'b0;
            exp <= 8'b0;
            frac <= 23'b0;
            fin <= 1'b0;
        end
    end
endmodule
