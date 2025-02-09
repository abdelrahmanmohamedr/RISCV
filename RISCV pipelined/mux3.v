//////////////////////////////////////////////////////////////////////////
/// Name: Abdelrahman Mohamed Ragab
/// Module-Name: mux3
//////////////////////////////////////////////////////////////////////////

module mux3(operand_1, operand_2, operand_3, select, result);

    parameter SIZE = 32;

    // input port
    input [SIZE-1:0] operand_1, operand_2, operand_3;                         // Input operands (32 bits each)
    input [1:0] select;                                                       // Select signal (2 bits)

    // output port
    output reg [SIZE-1:0] result;                                             // Output (32 bits)

    // Always block to assign the output based on the select signal
    always @(*) begin
        case (select)
            2'b00: result = operand_1;
            2'b01: result = operand_2;
            2'b10: result = operand_3;
            default: result = operand_1; // Default case
        endcase
    end

endmodule