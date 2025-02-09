//////////////////////////////////////////////////////////////////////////
/// Name: Abdelrahman Mohamed Ragab
/// module name: fetch_decode_register
//////////////////////////////////////////////////////////////////////////

module fetch_decode_register (instructionF, pcF, pc_plus_fourF, instructionD, pcD, pc_plus_fourD, clk, CLR, EN);

    // input port
    input [31:0] instructionF, pcF, pc_plus_fourF;                      // Input data (32 bits)
    input clk, CLR, EN;                                                 // Clock, clear, and enable signals

    // output port
    output reg [31:0] instructionD, pcD, pc_plus_fourD;                     // Output data (32 bits)

    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        if (CLR) begin
            // If clear is high, set the output to 0
            instructionD <= 32'h00000013;
            pcD <= 32'b0;
            pc_plus_fourD <= 32'b0;
        end else if (!EN) begin
            // If enable is high, set the output to the input value
            instructionD <= instructionF;
            pcD <= pcF;
            pc_plus_fourD <= pc_plus_fourF;
        end
    end

endmodule