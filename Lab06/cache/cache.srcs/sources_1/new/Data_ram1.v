module Data_ram1
#(  parameter Index_width = 7,
    parameter Block_width = 128  
)
(
    input wire clk, // clock
    input wire en, // enable
    input wire [Index_width-1:0] addr, // address
    input wire [Block_width-1:0] din, // data write in
    output reg [Block_width-1:0] dout // data read out
);

    parameter NUM_of_sets = 2 ** Index_width;

    reg [Block_width-1:0] cache_data [0:NUM_of_sets-1];
    reg [Block_width-1:0] same_data;

    // initial begin
    //     $readmemh("data_ram1.mem", cache_data);
    // end

    initial begin
        cache_data[0] = 128'h0000000a_0000000b_0000000c_0000000d;
        cache_data[1] = 128'h1000000a_1000000b_1000000c_1000000d;
        cache_data[2] = 128'h2000000a_2000000b_2000000c_2000000d;
        cache_data[3] = 128'h3000000a_3000000b_3000000c_3000000d;
    end

    always @(posedge clk) 
    begin
        same_data <= cache_data[addr];
        if (en) begin
            cache_data[addr] <= din;
        end
        dout <= same_data;
    end
endmodule