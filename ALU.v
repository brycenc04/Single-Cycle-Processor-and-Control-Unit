module ALU(BusW, Zero, BusA, BusB, ALUCtrl);
	output reg [63:0] BusW; // 64-bit output
	output Zero; // 1 or 0 based on value busW
	input [63:0] BusA, BusB; // 64-bit inputs
	input [3:0] ALUCtrl; // 4-bit control signal

	always @(*)
	begin
      case(ALUCtrl)
	4'b0000: begin
      BusW = BusA & BusB; // AND operation
    end
	
      4'b0001: begin
      BusW = BusA | BusB; // ORR operation
    end
	
      4'b0010:begin
      BusW = BusA + BusB; // ADD operation
    end
	
      4'b0110: begin
      BusW = BusA - BusB; // SUB operation
    end
	
      4'b0111: begin
      BusW = BusB; // PassB operation
    end
	
    endcase
	
    end

  assign Zero = (BusW==0) ? 1'b1: 1'b0; // zero = 0 if W!=0, zero = 1 if W = 0
	endmodule
