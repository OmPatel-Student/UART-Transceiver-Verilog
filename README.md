# UART Transceiver (Verilog HDL)

This project implements a UART (Universal Asynchronous Receiver Transmitter) in **Verilog HDL** using **Xilinx Vivado**. It includes separate transmitter and receiver modules, a baud rate generator, and a top module that integrates all of them into a complete UART transceiver.

The receiver is designed using **16× oversampling**, where it samples the incoming serial data at 16 times the baud rate. This improves the accuracy of data reception and makes the communication more reliable.

---

## Features

- 8-bit UART Transmitter
- 8-bit UART Receiver
- 16× Oversampling Receiver
- Baud Rate Generator
- Top-Level UART Integration
- RTL Schematics
- Simulation Waveforms
- Testbenches for all major modules

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

## Modules

| Module | Description |
| :------ | :---------- |
| UART Transmitter | Converts 8-bit parallel data into serial data with start and stop bits. |
| UART Receiver | Receives serial data using **16× oversampling** and reconstructs the original 8-bit data. |
| Baud Rate Generator | Generates the baud clocks required by the transmitter and receiver. |
| UART Top | Connects all the modules together to form a complete UART transceiver. |

---

## 16× Oversampling

The transmitter operates with the normal baud clock, while the receiver uses a clock that is **16 times faster**.

Instead of sampling each bit only once, the receiver samples at **16× the baud rate** and captures the bit near its center. This improves timing accuracy and helps achieve more reliable communication.

---

## Verification

The design was verified in **Xilinx Vivado** using simulation testbenches.

The repository includes:

- Design files
- Testbenches
- RTL schematics
- Simulation waveforms
- Top-level loopback verification

---

## Tools Used

| Tool | Purpose |
| :--- | :------ |
| Xilinx Vivado | Design entry, simulation, and RTL analysis |
| Verilog HDL | Hardware Description Language |

---

## Author

**Om Patel**  
B.Tech. Electronics & Communication Engineering  
Nirma University
