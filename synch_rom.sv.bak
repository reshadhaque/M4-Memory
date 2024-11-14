//ROM (Read Only Memory)
//ROM is essentially a really large lookup table (LUT)
//Coded into the FPGA fabric, cannot be instatiated like Block Ram automatically
//We cannot write to ROM, we can only read from it

//We can force ROM to use Block Ram but:
//ROM is usually not synchronous, but we need to specify a clock if we want to utilize Block Ram for the ROM


module synch_rom(
    input logic clk,
    input logic [2:0] addr,
    output logic [1:0] data
);

    (*rom_style = "block" *) logic [1:0] rom [0:7]; //2**3-1 (2**ADDR_WIDTH-1) 
    //^^^^^^^
    //Quartus and Vivado will not use Bram because this ROM is very small, so we use this "Synthesis Arrtibute"

    //Quartus and Vivado only accepts this for Read Only Memory, Otherwise it is NOT synthesizeable
    initial
        $readmemb("truth_table.mem", rom); //Reads a binary file of memory called truth_table.mem and puts it into the rom //We can also make it a hex file with readmemh
    
    always_ff@(posedge clk)
        begin
            assign data = rom[addr];
        end

endmodule