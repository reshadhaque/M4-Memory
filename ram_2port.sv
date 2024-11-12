
module ram_2port
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)(
    input logic [ADDR_WIDTH-1:0] r_addr; //reading address
    input logic [ADDR_WIDTH-1:0] w_addr; //writing address
    input logic [DATA_WIDTH-1:0] w_data;
    input logic we;
    input logic clk;
    output logic [DATA_WIDTH-1:0] r_data;
);

//

endmodule