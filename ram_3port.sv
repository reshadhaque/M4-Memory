module ram_3port.sv #(ADDR_WIDTH = 3, DATA_WIDTH = 8)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] r_addr0,
    input logic [ADDR_WIDTH-1:0] r_addr1,
    input logic [ADDR_WIDTH-1:0] w_addr,
    input logic [DATA_WIDTH-1:0] w_data,
    output logic [DATA_WIDTH-1:0] r_data0,
    output logic [DATA_WIDTH-1:0] r_data1,
    input logic write_enable
)

    logic [DATA_WIDTH - 1: 0] memory [2**ADDR_WIDTH-1:0];

    always_ff@(posedge clk)
    begin
        if(write_enable)
            memory[w_addr] <= w_data;
    end

    assign memory[r_addr0] = r_data0;
    assign memory[r_addr1] = r_data1;
    
endmodule