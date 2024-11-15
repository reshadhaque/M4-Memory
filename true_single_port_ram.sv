//Single port ram used for both read or write
//Cant read and write at the same time

//True single port ram means Block Ram (Bram) will be used on FPGA

module true_single_port_ram #(parameter ADDR_WIDTH = 10, DATA_WIDTH = 8)(
    input logic clk,
    input logic we,
    input logic [ADDR_WIDTH-1:0] addr_a,
    input logic [DATA_WIDTH-1:0] din_a,
    output logic [DATA_WIDTH-1:0] dout_a
);

logic [DATA_WIDTH-1:0] memory [0:2*ADDR_WIDTH-1];

always_ff@(posedge clk)
begin
    if(we)
    begin
        memory[addr_a] <= din_a;
    end

    dout_a <= memory[addr_a];
end

endmodule