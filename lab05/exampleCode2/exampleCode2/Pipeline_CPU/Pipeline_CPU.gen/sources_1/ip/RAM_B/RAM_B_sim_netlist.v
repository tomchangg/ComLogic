// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Jun  4 22:13:58 2024
// Host        : WYJ-22 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/CO/Pipeline_CPU/Pipeline_CPU.gen/sources_1/ip/RAM_B/RAM_B_sim_netlist.v
// Design      : RAM_B
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "RAM_B,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module RAM_B
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.632725 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "RAM_B.mem" *) 
  (* C_INIT_FILE_NAME = "RAM_B.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  RAM_B_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27568)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
