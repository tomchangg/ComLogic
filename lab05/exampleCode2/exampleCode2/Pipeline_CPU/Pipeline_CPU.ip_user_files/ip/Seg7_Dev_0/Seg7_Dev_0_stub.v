// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Jun  4 22:11:44 2024
// Host        : WYJ-22 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/CO/Pipeline_CPU/Pipeline_CPU.gen/sources_1/ip/Seg7_Dev_0/Seg7_Dev_0_stub.v
// Design      : Seg7_Dev_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Seg7_Dev,Vivado 2021.1" *)
module Seg7_Dev_0(disp_num, point, les, scan, AN, segment)
/* synthesis syn_black_box black_box_pad_pin="disp_num[31:0],point[7:0],les[7:0],scan[2:0],AN[7:0],segment[7:0]" */;
  input [31:0]disp_num;
  input [7:0]point;
  input [7:0]les;
  input [2:0]scan;
  output [7:0]AN;
  output [7:0]segment;
endmodule
