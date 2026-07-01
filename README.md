# UART Transceiver (Verilog HDL)

A UART (Universal Asynchronous Receiver Transmitter) Transceiver designed in **Verilog HDL** and implemented using **Xilinx Vivado**. This project includes separate transmitter and receiver modules, a baud rate generator, and a top module integrating all components.

One of the key features of this implementation is the **16× oversampling receiver**, where the receiver samples incoming serial data at **16 times the baud rate** for improved timing accuracy and reliable data reception.

---

## Features

- UART Transmitter (8-bit data)
- UART Receiver (8-bit data)
- 16× Oversampling Receiver
- Baud Rate Generator
- Top Module Integration
- Loopback Testbench Verification
- RTL Schematics
- Simulation Waveforms

---

## Project Structure

```
UART-Transceiver/
│
├── UART_Top/
│   ├── Design Files
│   ├── Testbench
│   ├── RTL Schematic
│   └── Simulation Waveform
│
├── UART_Transmitter/
│   ├── Design Files
│   ├── Testbench
│   ├── RTL Schematic
│   └── Simulation Waveform
│
├── UART_Receiver/
│   ├── Design Files
│   ├── Testbench
│   ├── RTL Schematic
│   └── Simulation Waveform
│
└── Baud_Rate_Generator/
    ├── Design File
    └── RTL Schematic
```

---

## Module Overview

| Module | Description |
|---------|-------------|
| **UART Transmitter** | Serially transmits 8-bit parallel data with start and stop bits. |
| **UART Receiver** | Receives serial data using **16× oversampling** for accurate sampling and reconstructs the original 8-bit data. |
| **Baud Rate Generator** | Generates baud clocks for both the transmitter and the 16× receiver. |
| **UART Top** | Integrates the transmitter, receiver, and baud rate generator into a complete UART transceiver. |

---

## 16× Oversampling

Unlike a basic UART receiver that samples only once per bit, this design uses **16× oversampling**.

The baud rate generator provides:
- **1× baud clock** for the transmitter
- **16× baud clock** for the receiver

This allows the receiver to sample each incoming bit near its center, improving synchronization and making the communication more tolerant to timing mismatches between the transmitter and receiver.

---

## Verification

The design has been verified in **Xilinx Vivado** using simulation testbenches.

Included in the repository:

- RTL Schematics
- Simulation Waveforms
- Individual module testbenches
- Top-level loopback verification

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Xilinx Vivado | Design, Simulation and RTL Analysis |
| Verilog HDL | Hardware Description Language |

---

## Author

**Om Patel**  
Electronics & Communication Engineering  
Nirma University
