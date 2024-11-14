//ROM (Read Only Memory)
//ROM is essentially a really large lookup table (LUT)
//Coded into the FPGA fabric, cannot be instatiated like Block Ram automatically
//We cannot write to ROM, we can only read from it

//We can force it to use Block Ram (Bram) 


module rom_with_file(
    input logic [2:0] addr,
    output logic [1:0] data
);

    logic [1:0] rom [0:7]; //2**3-1 (2**ADDR_WIDTH-1)

    //Quartus and Vivado only accepts this for Read Only Memory, Otherwise it is NOT synthesizeable
    initial
        $readmemb("truth_table.mem", rom); //Reads a binary file of memory called truth_table.mem and puts it into the rom //We can also make it a hex file with readmemh
    assign data = rom[addr];

endmodule