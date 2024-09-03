module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output reg [63:0] NextPC;
   
   wire or1, and1; 
   wire [63:0] shiftleft;

   assign and1 = Branch && ALUZero;
   assign or1 = and1 || Uncondbranch;
   assign shiftleft = SignExtImm64 << 2;
   always @(*) begin
      case(or1)
         1'b0: begin
            NextPC = CurrentPC + 4;
         end
         1'b1: begin
            NextPC = CurrentPC + shiftleft;
         end
      endcase
   end
endmodule
