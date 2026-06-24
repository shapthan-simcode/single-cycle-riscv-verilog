# Single-Cycle RISC-V Processor in Verilog

## Overview

This project implements a Single-Cycle RISC-V (RV32I) Processor using Verilog HDL. The processor is capable of fetching, decoding, and executing basic RISC-V instructions while demonstrating the complete software-to-hardware workflow from C code compilation to processor simulation. The design includes core datapath components such as the Program Counter (PC), Instruction Memory, Register File, Immediate Generator, Control Unit, ALU, and a GPIO peripheral. Verification is performed using Icarus Verilog and GTKWave.

---

## Features

- RV32I Single-Cycle Processor Architecture
- Program Counter (PC)
- Instruction Memory
- Instruction Decoder
- Register File (32 Registers)
- Immediate Generator
- Control Unit
- Arithmetic Logic Unit (ALU)
- GPIO Peripheral Integration
- GTKWave Waveform Verification
- RISC-V GCC Toolchain Support
- C → ELF → BIN → HEX Workflow

---

## Architecture

```text
                +----------------+
                | Program Counter|
                +--------+-------+
                         |
                         v
                +----------------+
                | Instruction Mem|
                +--------+-------+
                         |
                         v
                +----------------+
                |    Decoder     |
                +--------+-------+
                         |
          +--------------+--------------+
          |                             |
          v                             v
 +----------------+         +----------------+
 | Register File  |         | Immediate Gen  |
 +--------+-------+         +----------------+
          |                             |
          +--------------+--------------+
                         |
                         v
                +----------------+
                |      ALU       |
                +--------+-------+
                         |
                         v
                +----------------+
                |      GPIO      |
                +----------------+
```

---

## Project Structure

```text
single-cycle-riscv-verilog/
│
├── alu.v
├── control.v
├── cpu_top.v
├── decoder.v
├── gpio.v
├── imm_gen.v
├── instruction_memory.v
├── pc.v
├── reg.v
├── tb_cpu.v
│
├── firmware/
│   ├── program.c
│   └── link.ld
│
├── firmware.hex
├── README.md
└── .gitignore
```

---

## Software Flow

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

---

## Compilation Flow

### Compile C Program

```bash
riscv64-unknown-elf-gcc \
-march=rv32i \
-mabi=ilp32 \
-nostdlib \
-c firmware/program.c \
-o program.o
```

### Link Executable

```bash
riscv64-unknown-elf-ld \
-m elf32lriscv \
-T firmware/link.ld \
program.o \
-o firmware.elf
```

### Generate Binary

```bash
riscv64-unknown-elf-objcopy \
-O binary \
firmware.elf \
firmware.bin
```

### Generate HEX File

```bash
hexdump -ve '1/4 "%08x\n"' firmware.bin > firmware.hex
```

---

## Simulation

Compile and simulate the processor:

```bash
iverilog *.v -o cpu.out
vvp cpu.out
```

Generate waveform:

```bash
gtkwave processor.vcd
```

---

## GPIO Verification

The GPIO peripheral is connected to the processor datapath and can be observed through GTKWave during simulation. The waveform verifies instruction execution, ALU operation, register activity, and GPIO updates.

> Add your waveform screenshots in the `images/` folder and link them below.

```markdown
![GPIO Waveform](images/gpio_waveform.png)
```

---

## Tools Used

- Verilog HDL
- VS Code
- WSL Ubuntu
- Icarus Verilog
- GTKWave
- Yosys
- TerosHDL
- RISC-V GNU Toolchain

---

## Learning Outcomes

- RISC-V ISA Fundamentals
- Processor Datapath Design
- Verilog HDL Development
- Register File Design
- ALU Design
- Peripheral Integration (GPIO)
- Hardware Simulation and Debugging
- GTKWave Analysis
- Software-to-Hardware Workflow
- Git and GitHub Project Management

---

## Future Improvements

- Load (LW) Instruction Support
- Store (SW) Instruction Support
- Branch Instructions (BEQ/BNE)
- Jump Instructions (JAL/JALR)
- Memory-Mapped GPIO
- UART Peripheral
- 5-Stage Pipelined Processor
- FPGA Implementation
- RISC-V SoC Development

---

## Author

**Nithya Shapthan**

Electronics and Communication Engineering (ECE)  
VIT Chennai

GitHub: https://github.com/shapthan-simcode
