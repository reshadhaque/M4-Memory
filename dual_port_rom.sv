//ROM (Read Only Memory)
//ROM is essentially a really large lookup table (LUT)
//Coded into the FPGA fabric, cannot be instatiated like Block Ram automatically
//We cannot write to ROM, we can only read from it

//We can force ROM to use Block Ram but:
//ROM is usually not synchronous, but we need to specify a clock if we want to utilize Block Ram for the ROM


module dual_port_rom
#(parameter data_width=8, parameter addr_width=8)
(
	input [(addr_width-1):0] addr_a, addr_b,
	input clk, 
	output reg [(data_width-1):0] q_a, q_b
);
	reg [data_width-1:0] rom[2**addr_width-1:0];

	initial // Read the memory contents in the file
			 //dual_port_rom_init.txt. 
	begin
		$readmemb("truth_table.mem", rom);
	end

	always @ (posedge clk)
	begin
		q_a <= rom[addr_a];
		q_b <= rom[addr_b];
	end
endmodule