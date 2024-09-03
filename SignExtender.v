module SignExtender(extended, instruction, ctrl);
    output reg [63:0] extended; // 64-bit sign extended output
    input [25:0] instruction; // 26-bit input
    input [2:0] ctrl; // 3-bit control signal
    reg extendedBit; // need extended bit

    always @(*)
    begin
        case (ctrl) // case statement for control signal
            3'b000: begin // I-type
                extendedBit = 0;
                extended = {{52{extendedBit}}, instruction[21:10]}; 
            end
            3'b001: begin // D-type
                extendedBit = instruction[20];
                extended = {{55{extendedBit}}, instruction[20:12]}; 
            end
            3'b010: begin // B-type
                extendedBit = instruction[25];
                extended = {{38{extendedBit}}, instruction[25:0]}; 
            end
            3'b011: begin // CB-type
                extendedBit = instruction[23];
                extended = {{45{extendedBit}}, instruction[23:5]};
            end
            3'b100: begin // MOVZ
                extendedBit = 0;
                case(instruction[22:21])
                    2'b00 : extended = {{48{extendedBit}}, instruction[20:5]};
                    2'b01 : extended = {{32{extendedBit}}, instruction[20:5], {16{extendedBit}}};
                    2'b10 : extended = {{16{extendedBit}}, instruction[20:5], {32{extendedBit}}};
                    2'b11 : extended = {instruction[20:5], {48{extendedBit}}};
                endcase
            end
        endcase
    end 

endmodule
