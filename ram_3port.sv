module ram_3port.sv #(ADDR_WIDTH = 3, DATA_WIDTH = 8)(
    input logic [ADDR_WIDTH-1:0] r_addr0;
    input logic [ADDR_WIDTH-1:0] r_addr1;
    input logic [ADDR_WIDTH-1:0] w_addr;
    input logic [DATA_WIDTH-1:0] w_data;
    output logic [DATA_WIDTH-1:0] r_data0;
    output logic [DATA_WIDTH-1:0] r_data1;
    input logic we
)

endmodule