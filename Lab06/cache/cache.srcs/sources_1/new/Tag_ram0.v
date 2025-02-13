module Tag_ram0
#(  parameter Index_width = 7,
    parameter Tag_width = 23,
    parameter Valid = 1,
    parameter LRU = 1,
    parameter Dirty = 1,
    parameter Block_width = Tag_width + Valid + LRU + Dirty
)
(
    input wire clk, // clock
    input wire en, // enable
    input wire [Index_width-1:0] addr, // address
    input wire [Block_width-1:0] din, // data write in
    output reg [Block_width-1:0] dout // data read out
);

    parameter NUM_of_sets = 2 ** Index_width;

    reg [Block_width-1:0] cache_tag [0:NUM_of_sets-1];
    reg [Block_width-1:0] same_data;

    // initial begin
    //     $readmemh("tag_ram0.mem", cache_tag);
    // end

    initial begin
        cache_tag[0] = 26'b10000000000000000000000000;
        cache_tag[1] = 26'b10000000000000000000000001;
        cache_tag[2] = 26'b10000000000000000000000010;
        cache_tag[3] = 26'b10000000000000000000000011;
    end

    always @(posedge clk) 
    begin
        same_data <= cache_tag[addr];
        if (en) begin
            cache_tag[addr] <= din;
        end
        dout <= same_data;
    end
endmodule