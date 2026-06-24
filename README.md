# Single-Cycle RISC-V Processor in Verilog

## Overview

This project implements an educational Single-Cycle RISC-V (RV32I) Processor using Verilog HDL. The processor consists of core datapath components including the Program Counter (PC), Instruction Memory, Instruction Decoder, Register File, Immediate Generator, ALU, Control Unit, and Data Memory.

The project also demonstrates the complete RISC-V software-to-hardware workflow by compiling C programs using the RISC-V GCC toolchain, linking them with a custom linker script, generating ELF and HEX files, and loading instructions into the processor's instruction memory.

## Architecture

The processor follows a Single-Cycle Datapath architecture:

```text
           PC
            │
            ▼
  Instruction Memory
            │
            ▼
         Decoder
            │
     ┌──────┴──────┐
     ▼             ▼
 Register File   Imm Gen
     │             │
     └──────┬──────┘
            ▼
           ALU
            │
     ┌──────┴──────┐
     ▼             ▼
 Data Memory   Write Back
```

## Project Structure

```text
single-cycle-riscv-verilog/
│
├── pc.v
├── instruction_memory.v
├── decoder.v
├── imm_gen.v
├── reg.v
├── alu.v
├── control.v
├── data_memory.v
├── cpu_top.v
├── tb_cpu.v
│
├── firmware/
│   ├── program.c
│   └── link.ld
│
├── firmware.hex
└── README.md
```

## Features

- Single-Cycle RV32I Processor Design
- Program Counter (PC)
- Instruction Memory
- Instruction Decoder
- Register File
- Immediate Generator
- Arithmetic Logic Unit (ALU)
- Control Unit
- Data Memory
- Verilog Testbench
- RISC-V GCC Toolchain Integration
- C → ELF → HEX Workflow

## Toolchain Flow

```text
program.c
    │
    ▼
RISC-V GCC
    │
    ▼
program.o
    │
    ▼
firmware.elf
    │
    ▼
firmware.bin
    │
    ▼
firmware.hex
    │
    ▼
Instruction Memory
    │
    ▼
RISC-V Processor
```

## Tools Used

- Verilog HDL
- VS Code
- WSL Ubuntu
- Yosys
- TerosHDL
- Icarus Verilog
- RISC-V GCC Toolchain

## Compilation Flow

Compile C program:

```bash
riscv64-unknown-elf-gcc \
-march=rv32i \
-mabi=ilp32 \
-nostdlib \
-c firmware/program.c \
-o program.o
```

Link executable:

```bash
riscv64-unknown-elf-ld \
-m elf32lriscv \
-T firmware/link.ld \
program.o \
-o firmware.elf
```

Generate binary:

```bash
riscv64-unknown-elf-objcopy \
-O binary \
firmware.elf \
firmware.bin
```

Generate HEX file:

```bash
hexdump -ve '1/4 "%08x\n"' firmware.bin > firmware.hex
```

## Learning Outcomes

- Computer Architecture Fundamentals
- RISC-V ISA Basics
- Verilog HDL Design
- Processor Datapath Development
- Hardware Simulation
- Software-to-Hardware Execution Flow
- Linux-Based FPGA/VLSI Development Environment

## Future Improvements

- Support for Load/Store Instructions (LW/SW)
- Branch Instructions (BEQ/BNE)
- Jump Instructions (JAL/JALR)
- Full RV32I Support
- 5-Stage Pipelined Processor
- FPGA Implementation
- System-on-Chip (SoC) Integration

## Author

**Nithya Shapthan**

ECE Student | Digital Design | RISC-V | VLSI | Embedded Systems
