`timescale 1ns / 1ps
module Cache(
    input wire clk, // clock
    input wire rst, // reset
    input wire [31:0] data_cpu_write, // data write in
    input wire [127:0] data_mem_read, // data read in
    input wire [31:0] addr_cpu, // cpu addr
    input wire wr_cpu, // cpu write enable
    input wire rd_cpu, // cpu read enable
    input wire ready_mem, // memory ready

    output reg wr_mem, // memory write enable
    output reg rd_mem, // memory read enable
    output reg [127:0] data_mem_write, // data to mem
    output reg [31:0] data_cpu_read, // data to cpu
    output reg [31:0] addr_mem // memory addr
    );
    
    reg [1:0] state, next_state;
    parameter [1:0] IDLE = 2'b00, CompareTag = 2'b01, Allocate = 2'b10 , WriteBack = 2'b11;
    reg en0,en1,ent0,ent1; // input enable
    reg [127:0] wdata;  // input din for Data_ram
    reg [25:0] wtag0, wtag1;    // input din for Tag_ram
    wire [6:0] index;   // input addr for ram
    wire [22:0] cpu_tag; // Tag in addr_cpu
    wire [1:0] cpu_offset;

    wire [127:0] rdata0, rdata1; 
    wire [25:0] rtag0, rtag1;

    wire cpu_req_valid;
    wire hit0, hit1, hit;

    wire valid0, valid1, valid;
    wire LRU0, LRU1;
    wire dirty0, dirty1;

    assign cpu_req_valid = wr_cpu | rd_cpu;
    assign index = addr_cpu[8:2];
    assign cpu_tag = addr_cpu[31:9];
    assign cpu_offset = addr_cpu[1:0];
    assign valid0 = rtag0[25];
    assign LRU0 = rtag0[24];
    assign dirty0 = rtag0[23];

    assign valid1 = rtag1[25];
    assign LRU1 = rtag1[24];
    assign dirty1 = rtag1[23];

    assign hit0 = (cpu_tag == rtag0[22:0]) & valid0;
    assign hit1 = (cpu_tag == rtag1[22:0]) & valid1;
    assign hit = hit0 | hit1;
    assign valid = valid0 | valid1;
    assign dirty = dirty0 | dirty1;

    always@(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always@(*) begin
        case(state)
            IDLE: begin
                en0  = 1'b0;
                en1  = 1'b0;
                ent0 = 1'b0;
                ent1 = 1'b0;
                wr_mem = 1'b0;
                rd_mem = 1'b0;

                if(cpu_req_valid)
                    next_state = CompareTag;
                else
                    next_state = IDLE;
            end

            CompareTag: begin
                en0  = 1'b0;
                en1  = 1'b0;
                ent0 = 1'b0;
                ent1 = 1'b0;
                wr_mem = 1'b0;
                rd_mem = 1'b0;

                if(hit) begin
                    next_state = IDLE;
                    ent0 = 1'b1;
                    ent1 = 1'b1;
                    if(rd_cpu) begin
                        if(hit0) begin
                            wtag0 = {rtag0[25],1'b0,rtag0[23:0]}; // change LRU (0 for new)
                            wtag1 = {rtag1[25],1'b1,rtag1[23:0]}; // change LRU (1 for old)

                            case(cpu_offset)
                                2'b00: data_cpu_read = rdata0[31:0];
                                2'b01: data_cpu_read = rdata0[63:32];
                                2'b10: data_cpu_read = rdata0[95:64];
                                2'b11: data_cpu_read = rdata0[127:96];
                            endcase
                        end

                        if(hit1) begin
                            wtag0 = {rtag0[25],1'b1,rtag0[23:0]}; // change LRU (0 for old)
                            wtag1 = {rtag1[25],1'b0,rtag1[23:0]}; // change LRU (1 for new)

                            case(cpu_offset)
                                2'b00: data_cpu_read = rdata1[31:0];
                                2'b01: data_cpu_read = rdata1[63:32];
                                2'b10: data_cpu_read = rdata1[95:64];
                                2'b11: data_cpu_read = rdata1[127:96];
                            endcase
                        end
                    end

                    if(wr_cpu) begin
                        if(hit0) begin
                            en0 = 1'b1;
                            wtag0 = {rtag0[25],1'b0,1'b1,rtag0[22:0]}; // change LRU (0 for new), change dirty (1 for only in cache)
                            wtag1 = {rtag1[25],1'b1,rtag1[23:0]}; // change LRU (1 for old)
                            
                            case(cpu_offset)
                                2'b00: wdata = {rdata0[127:32],data_cpu_write};
                                2'b01: wdata = {rdata0[127:64],data_cpu_write,rdata0[31:0]};
                                2'b10: wdata = {rdata0[127:96],data_cpu_write,rdata0[63:0]};
                                2'b11: wdata = {data_cpu_write,rdata0[95:0]};
                            endcase
                        end
                        else if(hit1) begin
                            en1 = 1'b1;
                            wtag0 = {rtag0[25],1'b1,rtag0[23:0]}; // change LRU (1 for old)
                            wtag1 = {rtag1[25],1'b0,1'b1,rtag1[23:0]}; // change LRU (0 for new), change dirty (1 for only in cache)
                            
                            case(cpu_offset)
                                2'b00: wdata = {rdata1[127:32],data_cpu_write};
                                2'b01: wdata = {rdata1[127:64],data_cpu_write,rdata1[31:0]};
                                2'b10: wdata = {rdata1[127:96],data_cpu_write,rdata1[63:0]};
                                2'b11: wdata = {data_cpu_write,rdata1[95:0]};
                            endcase
                        end
                    end
                end

                else begin
                    if(dirty)
                        next_state = WriteBack;
                    else
                        next_state = Allocate;
                end
            end

            Allocate: begin
                en0  = 1'b0;
                en1  = 1'b0;
                ent0 = 1'b0;
                ent1 = 1'b0;
                rd_mem = 1'b0;
                wr_mem = 1'b0;

                addr_mem = {addr_cpu[31:2],2'b00};
                wdata = data_mem_read;

                if(ready_mem) begin
                    next_state = CompareTag;
                    rd_mem = 1'b1; // memory read enable
                    ent0 = 1'b1;
                    ent1 = 1'b1;

                    if(LRU0) begin
                        en0 = 1'b1;
                        wtag0 = {1'b1,1'b0,1'b0,cpu_tag}; // valid , LRU (0 for new), dirty (0 for both in cache and memory)
                        wtag1 = {1'b1,1'b1,rtag1[23:0]}; // valid, LRU (1 for old)
                    end

                    else begin
                        en1 = 1'b1;
                        wtag0 = {1'b1,1'b1,rtag0[23:0]};
                        wtag1 = {1'b1,1'b0,1'b0,cpu_tag};
                    end

                end

                else 
                    next_state = Allocate;
            end

            WriteBack: begin
                en0  = 1'b0;
                en1  = 1'b0;
                ent0 = 1'b0;
                ent1 = 1'b0;
                rd_mem = 1'b0; 
                wr_mem = 1'b0;
                addr_mem = {addr_cpu[31:2],2'b00};

                if(ready_mem) begin
                    next_state = Allocate;
                    wr_mem = 1'b1;// memory write enable

                    if(dirty0)
                        data_mem_write = rdata0;
                    else if(dirty1)
                        data_mem_write = rdata1;
                end 

                else 
                    next_state = WriteBack;
            end

            default: next_state = IDLE;
        endcase

    end
    
    Data_ram0 data_ram0(
        .clk(~clk),
        .en(en0),//
        .din(wdata),//
        .addr(index),
        .dout(rdata0)//
    );
    Data_ram1 data_ram1(
        .clk(~clk),
        .en(en1),//
        .din(wdata),//
        .addr(index),
        .dout(rdata1)//
    );
    Tag_ram0 tag_ram0(
        .clk(~clk),
        .en(ent0),//
        .din(wtag0),//
        .addr(index),
        .dout(rtag0)//
    );
    Tag_ram1 tag_ram1(
        .clk(~clk),
        .en(ent1),//
        .din(wtag1),//
        .addr(index),
        .dout(rtag1)//
    );
endmodule

