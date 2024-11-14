module simple_dual_port_ram #(parameter ADDR_WIDTH = 10, DATA_WIDTH = 8)(
    input logic clk,
    input logic we,
    input logic [ADDR_WIDTH-1:0] addr_r, addr_w,
    input logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] memory [0: 2**ADDR_WIDTH-1];

//One port is only for reading, one port is only for writing
//The write port only activates when we (write enable) is asserted
always_ff@(posedge clk)
begin

    if(we)
        begin
        memory[addr_w] <= din;
        end
    
    dout<=memory[addr_r];
end


endmodule