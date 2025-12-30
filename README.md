# RISC-V RV32I Single-Cycle Processor 🧠⚙️

A synthesizable **RISC-V RV32I single-cycle processor** implemented in **SystemVerilog**, designed to closely follow the RISC-V ISA specification.  
This project focuses on clean RTL design, modular datapath construction, and clarity of control logic.

---

## ✨ Features
- RV32I base integer instruction set
- Single-cycle datapath
- Modular RTL (ALU, Control, Decode, Fetch, Memory)
- Branch and jump support
- Byte / halfword / word memory accesses
- Zero and sign extension handling
- Fully parameterized instruction & data memory

---

## 🧱 Microarchitecture Overview
- **Fetch**: Instruction fetch from ROM
- **Decode**: Instruction decoding and immediate generation
- **Execute**: ALU operations and branch decisions
- **Memory**: Load/store with size control
- **Writeback**: ALU / Memory / PC / Immediate

See `datapath.png` for the full datapath diagram.

---

## 📂 Project Structure

### 🔧 RTL (Core Processor Logic)
- `alu.sv` – Arithmetic Logic Unit (RV32I operations)
- `branchcontrol.sv` – Branch decision logic (BEQ, BNE, BLT, etc.)
- `control.sv` – Main control unit
- `decode.sv` – Instruction decode and immediate generation
- `fetch.sv` – Instruction fetch stage
- `registerfile.sv` – 32×32 register file
- `datamemory.sv` – Data memory
- `instruction_memory.sv` – Instruction memory (ROM)
- `risc_pkg.sv` – RISC-V constants, enums, and types
- `top.sv` – Top-level single-cycle processor

### 🧪 Simulation
- `sim/tb_top.sv` – Testbench

### 🧠 Programs
- `machine_code.mem` – Compiled RISC-V machine code
- create this file ^ using a text editor and copy one of the programs into this `machine_code.mem` file

### 📄 Documentation
- `datapath.png` – Processor datapath diagram
- `RISC-V 32i ISA` - ISA descriptions

