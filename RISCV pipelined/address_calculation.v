//////////////////////////////////////////////////////////////////////////
/// Name: Abdelrahman Mohamed Ragab
/// module name: address_calculation
//////////////////////////////////////////////////////////////////////////

module address_calculation (pc, imm_extend, branch_jump_address);

    // input port
    input [31:0] pc, imm_extend;                                        // Input PC and extended immediate value (32 bits each)

    // output port
    output reg [31:0] branch_jump_address;                              // Output branch/jump address (32 bits)

    // Always block to calculate the branch/jump address
    always @(*) begin
        // Calculate the branch/jump address by adding the PC and the extended immediate value
        branch_jump_address = pc + imm_extend;
    end
    
endmodule