module data_memory(
    input wire clk,
    input wire [7:0] address,
    input wire [7:0] data_in,
    input wire write_enable,
    input wire read_enable,
    output reg [7:0] data_out
);
    reg [7:0] ram[0:255];

    always @(posedge clk)
    begin
        if (read_enable)
            data_out <= ram[address];
		  else if (write_enable)
            ram[address] <= data_in;
    end
endmodule
