# RISC-V Processor Design and Implementation

I am excited to share my latest project, where I designed and implemented both single-cycle and pipelined versions of a RISC-V processor using Verilog. This project involves a full RTL implementation, functional verification, synthesis, and static timing analysis, providing an in-depth exploration of computer architecture and hardware design.

## Table of Contents
1. [Overview](#overview)  
2. [RISCV ISA](#riscv-isa)  
   - [Different Extensions](#different-extensions)  
   - [RV32I Base Integer Instruction Set](#rv32i-base-integer-instruction-set)  
   - [Instruction Formats](#instruction-formats)  
3. [Single-Cycle RISC-V Processor](#single-cycle-risc-v-processor)  
   - [Design Overview](#design-overview-single-cycle)  
   - [Verilog Code and Block Explanation](#verilog-code-and-block-explanation-single-cycle)  
   - [Simulation and Code Compilation](#simulation-and-code-compilation-single-cycle)  
   - [RTL Analysis & Synthesis Schematic](#rtl-analysis--synthesis-schematic-single-cycle)  
   - [Static Timing Analysis and Utilization Reports](#static-timing-analysis-and-utilization-reports-single-cycle)  
4. [Pipelined RISC-V Processor](#pipelined-risc-v-processor)  
   - [Pipeline Architecture and Block Explanation](#pipeline-architecture-and-block-explanation)  
   - [Hazard Management and Additional Units](#hazard-management-and-additional-units)  
   - [Verilog Code and Implementation Details](#verilog-code-and-implementation-details-pipelined)  
   - [Simulation and Code Compilation](#simulation-and-code-compilation-pipelined)  
   - [RTL Analysis & Synthesis Schematic](#rtl-analysis--synthesis-schematic-pipelined)  
   - [Static Timing Analysis and Utilization Reports](#static-timing-analysis-and-utilization-reports-pipelined)  
5. [References](#references)
   
---

## Overview

This project implements two versions of a RISC-V processor:

- **Single-Cycle Processor:**  
  A straightforward design where each instruction completes in one clock cycle. Although the design is simpler, the long critical path can limit the clock speed.

- **Pipelined Processor:**  
  A performance-improving version using a five-stage pipeline. This design incorporates advanced techniques like pipeline registers, forwarding, hazard detection, and basic branch prediction to manage data and control hazards.

The repository includes the entire RTL code, simulation results, synthesis reports, and static timing analysis for both versions of the processor.

---

## RISCV ISA

### Different Extensions
The RISC-V architecture supports several optional extensions tailored to different computational needs. Notable extensions include:

- **M Extension:** For integer multiplication and division.  
- **A Extension:** For atomic operations.  
- **F and D Extensions:** For single and double-precision floating-point operations.  
- **C Extension:** For compressed instructions.  
- Other extensions such as Bit Manipulation, Vector Operations, and specialized control/status registers.

### RV32I Base Integer Instruction Set
Our design focuses on the RV32I Base Integer Instruction Set, which is the foundation for all RISC-V processors. This 32-bit ISA supports a standard set of operations critical to processor functionality.

### Instruction Formats
The RV32I ISA is divided into six formats:

- **R-type:** Register-to-register operations.  
- **I-type:** Immediate arithmetic and logical operations.  
- **S-type:** Store instructions.  
- **B-type:** Branch instructions.  
- **U-type:** Used for LUI and AUIPC instructions.  
- **J-type:** Jump instructions.  

Each format defines specific fields such as opcode, destination (rd), source registers (rs1, rs2), function codes (funct3, funct7), and immediates.

---

## Single-Cycle RISC-V Processor

### Design Overview (Single-Cycle)
In the single-cycle design, each instruction is executed in a single clock cycle. The following primary blocks are implemented:

- **PC Block:** Generates the next instruction address.  
- **Instruction Memory:** Stores the program code.  
- **ALU:** Performs arithmetic and logic operations.  
- **Register File:** Holds the processor’s registers.  
- **Data Memory:** Used for data storage.  
- **Control Unit:** Decides control signals for data flow.  
- **Branch/Jump Logic:** Evaluates branch and jump conditions.  
- **Extend Unit:** Sign-extends immediate values.  

### Verilog Code and Block Explanation (Single-Cycle)
The repository contains well-documented Verilog code covering all major blocks:

- **PC, Instruction Memory, ALU**  
- **Register File and Data Memory**  
- **Control Unit and Branch-Jump Decision Unit**  

### Simulation and Code Compilation (Single-Cycle)
Simulations were performed using:

- Predefined assembly tests from *“DDCA”* by Sarah L. Harris and David Money Harris.  
- Compilation and execution of C-code, which is converted to machine code and loaded into the processor for testing.  

### RTL Analysis & Synthesis Schematic (Single-Cycle)
Detailed RTL analysis, along with synthesis schematics, are provided to:

- Visualize the hardware implementation.  
- Validate the design’s timing.  

### Static Timing Analysis and Utilization Reports (Single-Cycle)
- **Static Timing Reports:** Ensure the design meets clock constraints.  
- **Utilization Reports:** Detail the FPGA resource usage for this processor.  

---

## Pipelined RISC-V Processor

### Pipeline Architecture and Block Explanation
The pipelined processor design divides execution into five key stages:

1. **Fetch Stage:** Retrieves instructions.  
2. **Decode Stage:** Decodes the instruction and performs preliminary operations.  
3. **Execute Stage:** Executes operations via the ALU.  
4. **Memory Stage:** Reads from or writes to data memory.  
5. **Write-Back Stage:** Writes results back to the register file.  

Each stage is separated by pipeline registers to maintain proper state transitions.

### Hazard Management and Additional Units
To efficiently handle hazards:

- **Forwarding/Bypassing Units:** Reduce stalls by utilizing the most recent data.  
- **Hazard Detection Unit:** Manages stalls when data dependencies are detected.  
- **Branch Address Calculation:** Implemented in the decode stage to support early branch decision-making and improve performance.  

### Verilog Code and Implementation Details (Pipelined)
The Verilog source includes:

- The same fundamental blocks as the single-cycle design, adapted into a pipelined architecture.  
- Additional units for hazard control and pipeline registers.  

### Simulation and Code Compilation (Pipelined)
Verification is done using the same test codes as the single-cycle design:

- Running predefined assembly tests.  
- Compiling C-code and converting it to machine code for verification.  

### RTL Analysis & Synthesis Schematic (Pipelined)
The RTL analysis for the pipelined processor includes:

- A breakdown of each pipeline stage.  
- Synthesis schematics illustrating the hardware mapping of the pipelined architecture.  

### Static Timing Analysis and Utilization Reports (Pipelined)
- **Static Timing Analysis:** Confirms the design meets performance metrics.  
- **Utilization Reports:** Highlight the resource consumption for the pipelined implementation.  

---

## References
- *“DDCA”* by Sarah L. Harris and David Money Harris.  
- The RISC-V Instruction Set Manual Volume I: Unprivileged ISA.  
- Additional documentation and slides used during the design process.  
