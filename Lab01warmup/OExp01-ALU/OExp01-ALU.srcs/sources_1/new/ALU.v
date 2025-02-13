`timescale 1ns / 1ps

module ALU(
    input [31:0] A,
    input [2:0] ALU_operation,
    input [31:0] B,
    output [31:0] res,
    output zero
    );
    wire [31:0] and32_res;         // AND操作结果
    wire [31:0] or32_res;          // OR操作结果
    wire [32:0] ADC_res;           // 加法（带进位）操作结果（32位+进位）
    wire [31:0] xor32_res_0;       // XOR操作结果(获得B的取反)
    wire [31:0] xor32_res_1;       // XOR操作结果(获得A与B的异或)
    wire [31:0] nor32_res;         // NOR操作结果
    wire [31:0] srl32_res;         // 逻辑右移操作结果
    wire [31:0] SignalExt_32_res;
    wire [31:0] MUX8T1_32_0_o;     // MUX的输出

    and32 and32_0(
        .A(A),
        .B(B),
        .res(and32_res)
    );

    or32 or32_0(
        .A(A),
        .B(B),
        .res(or32_res)
    );

    ADC32 ADC32_0(
        .A(A),
        .B(xor32_res_0),
        .C0(ALU_operation[2]),
        .S(ADC_res)
    );

    xor32 xor32_0(
        .A(SignalExt_32_res),
        .B(B),
        .res(xor32_res_0)
    );

    xor32 xor32_1(
        .A(A),
        .B(B),
        .res(xor32_res_1)
    );

    nor32 nor32_0(
        .A(A),
        .B(B),
        .res(nor32_res)
    );

    srl32 srl32_0(
        .A(A),
        .B(B),
        .res(srl32_res)
    );

    SignalExt_32 SignalExt_32_0(
        .S(ALU_operation[2]),
        .So(SignalExt_32_res)
    );    

    or_bit_32 or_bit_32_0(
        .A(MUX8T1_32_0_o),
        .o(zero)
    );

    MUX8T1_32 MUX8T1_32_0(
        .I0(and32_res),                 
        .I1(or32_res),                  
        .I2(ADC_res[31:0]),             
        .I3(xor32_res_1),                 
        .I4(nor32_res),                
        .I5(srl32_res),               
        .I6(ADC_res[31:0]),           
        .I7({31'b0, ADC_res[32]}),      
        .o(MUX8T1_32_0_o),            
        .s(ALU_operation)              
    );

    assign res = MUX8T1_32_0_o;

endmodule