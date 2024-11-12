
module ram_2port
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)(
    input logic [ADDR_WIDTH-1:0] r_addr; //reading address
    input logic [ADDR_WIDTH-1:0] w_addr; //writing address
    input logic [DATA_WIDTH-1:0] w_data;
    input logic write_enable;
    input logic clk;
    output logic [DATA_WIDTH-1:0] r_data;
);

//
    logic [DATA_WIDTH-1:0] memory [0:2**ADDR_WIDTH-1];

//Write operation
    always_ff@(posedge clk)
    begin
        if(write_enable)
            memory[w_addr] <= w_data;
    end

//Read operation

    assign r_data = memory[r_addr];


endmodule