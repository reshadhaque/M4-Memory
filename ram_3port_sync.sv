module ram_3port_sync.sv #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] r_addr0,
    input logic [ADDR_WIDTH-1:0] r_addr1,
    input logic [ADDR_WIDTH-1:0] w_addr,
    input logic [DATA_WIDTH-1:0] w_data,
    output logic [DATA_WIDTH-1:0] r_data0,
    output logic [DATA_WIDTH-1:0] r_data1,
    input logic write_enable
)

    //instantiate memory array
    logic [DATA_WIDTH - 1: 0] memory [0:2**ADDR_WIDTH-1];

    //synchronous write operation
    always_ff@(posedge clk)
    begin
        if(write_enable)
            memory[w_addr] <= w_data;
        assign r_data1 = memory[addr1]; //synchronous read operation
    end

    //asynchronous read operation
    assign r_data0 = memory[addr0];
    

endmodule