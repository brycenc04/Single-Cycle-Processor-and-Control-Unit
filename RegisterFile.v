module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);

	input [63:0] BusW;
	input [4:0] RA, RB, RW;
	input Clk, RegWr;

	output [63:0] BusA, BusB;

	reg [63:0] Regfile [31:0];
	// make Register 31 0
	initial begin
		Regfile [31] = 0;
	end
	
	assign #2 BusA =Regfile[RA];
	assign #2 BusB= Regfile[RB];
		

	always @(negedge Clk) begin
		if (RegWr && (RW !=31)) begin // don't allow writes to reg 31
			Regfile[RW] <=#3 BusW;
		end
	end
endmodule