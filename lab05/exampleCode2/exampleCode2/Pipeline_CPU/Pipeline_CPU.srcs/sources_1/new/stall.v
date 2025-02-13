`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 16:56:35
// Design Name: 
// Module Name: stall
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


module stall(
    input rst_stall, //¸´Î»
    input [4:0]Rs1_addr_ID,      //ÒëÂë½×¶Î¼Ä´æÆ÷¶ÁÈ¡µØÖ·1
    input [4:0]Rs2_addr_ID,      //ÒëÂë½×¶Î¼Ä´æÆ÷¶ÁÈ¡µØÖ·2
    input RegWrite_out_IDEX,     //Ö´ĞĞ½×¶Î¼Ä´æÆ÷Ğ´¿ØÖÆ
    input [4:0]Rd_addr_out_IDEX, //Ö´ĞĞ½×¶Î¼Ä´æÆ÷Ğ´µØÖ·
    input RegWrite_out_EXMem, //·Ã´æ½×¶Î¼Ä´æÆ÷Ğ´¿ØÖÆ
    input [4:0]Rd_addr_out_EXMem,//·Ã´æ½×¶Î¼Ä´æÆ÷Ğ´ÈëµØÖ·     
    input Rs1_used, //Rs1±»Ê¹ÓÃ
    input Rs2_used, //Rs2±»Ê¹ÓÃ
    input Branch_ID, //ÒëÂë½×¶Îbeq
    input BranchN_ID, //ÒëÂë½×¶Îbne
    input Jump_ID, //ÒëÂë½×¶Îjal
    input Branch_out_IDEX, //Ö´ĞĞ½×¶Îbeq
    input BranchN_out_IDEX, //?Ö´ĞĞ½×¶Îbne
    input Jump_out_IDEX, //Ö´ĞĞ½×¶Îjal
    input Branch_out_EXMem, //·Ã´æ½×¶Îbeq
    input BranchN_out_EXMem, //·Ã´æ½×¶Îbne
    input Jump_out_EXMem, //·Ã´æ½×¶Îjal
    output wire en_IF, //Á÷Ë®Ïß¼Ä´æÆ÷µÄÊ¹ÄÜĞÅºÅ¼°NOPĞÅºÅ
    output wire en_IFID,
    output wire NOP_IDEX,
    output wire NOP_IFID
    );
//    reg data_stall, control_stall;
//    always@*begin
//        if(rst_stall)begin 
//            data_stall <= 1'b0; 
//            control_stall <= 1'b0; 
//        end
//        else begin
//            // data stall
//            // memory
//            if(RegWrite_out_EXMem && Rs1_used && (Rs1_addr_ID!=5'b00000) && (Rs1_addr_ID == Rd_addr_out_EXMem))
//                data_stall <= 1'b1; 
//            else if(RegWrite_out_EXMem && Rs2_used && (Rs2_addr_ID!=5'b00000) && (Rs2_addr_ID == Rd_addr_out_EXMem))
//                data_stall <= 1'b1; 
//            // execute
//            else if(RegWrite_out_IDEX && Rs1_used && (Rs1_addr_ID!=5'b00000) && (Rs1_addr_ID == Rd_addr_out_IDEX))
//                data_stall <= 1'b1;
//            else if(RegWrite_out_IDEX && Rs2_used && (Rs2_addr_ID!=5'b00000) && (Rs2_addr_ID == Rd_addr_out_IDEX))
//                data_stall <= 1'b1;
//            // no data stall
//            else
//                data_stall <= 1'b0; 
//            // control stall
//            if((Branch_ID || BranchN_ID || Jump_ID) || (Branch_out_IDEX || BranchN_out_IDEX || Jump_out_IDEX) || (Jump_out_EXMem||BranchN_out_EXMem||Jump_out_EXMem))
//                control_stall <= 1'b1; 
//            // no control stall
//            else 
//                control_stall <= 1'b0; 
//        end
//    end
    
    wire data_stall, control_stall;
    
    assign data_stall =
        (RegWrite_out_EXMem && Rs1_used && (Rs1_addr_ID == Rd_addr_out_EXMem) && (Rs1_addr_ID!=0))||
        (RegWrite_out_EXMem && Rs2_used && (Rs2_addr_ID == Rd_addr_out_EXMem) && (Rs2_addr_ID!=0))||
        (RegWrite_out_IDEX && Rs1_used && (Rs1_addr_ID == Rd_addr_out_IDEX) && (Rs1_addr_ID!=0))||
        (RegWrite_out_IDEX && Rs2_used && (Rs2_addr_ID == Rd_addr_out_IDEX) && (Rs2_addr_ID!=0));
      
    assign control_stall =
        Branch_ID || BranchN_ID || Jump_ID ||
        Branch_out_IDEX || BranchN_out_IDEX || Jump_out_IDEX;

    
    assign en_IF = ~data_stall & ~control_stall; 
    assign en_IFID = ~data_stall & ~control_stall; 
    assign NOP_IDEX = data_stall; 
    assign NOP_IFID = control_stall; 
    
endmodule
