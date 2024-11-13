`timescale 1ns/1ps

module bram_sync_dual_port #(parameter ADDR_WIDTH = 10, DATA_WIDTH = 8)(
    input logic clk,
    input logic [ADDR_WIDTH-1:0] addr_a,
    input logic [ADDR_WIDTH-1:0] addr_b,
    output logic [DATA_WIDTH-1:0] dout_a,
    output logic [DATA_WIDTH-1:0] dout_b,
    input logic [DATA_WIDTH-1:0] din_a,
    input logic [DATA_WIDTH-1:0] din_b,
    input logic write_enable_a,
    input logic write_enable_b
);

    logic [DATA_WIDTH-1:0] memory [2**ADDR_WIDTH-1:0];

    always_ff@(posedge clk)
    begin
        if(write_enable_a)
            memory[addr_a] <= din_a;
        if(write_enable_b)
            memory[addr_b] <= din_b;

        dout_a <= memory[addr_a];
        dout_b <= memory[addr_b];
    end



endmodule