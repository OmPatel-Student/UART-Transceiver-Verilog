# UART Transceiver in Verilog

A synthesizable Universal Asynchronous Receiver Transmitter (UART) designed in **Verilog HDL** and implemented using **Xilinx Vivado**. The project includes independent transmitter and receiver modules, a baud rate generator, and a top-level UART transceiver integrating all components.

---

## Features

- 8-bit UART Communication
- Separate Transmitter (TX) and Receiver (RX)
- Configurable Baud Rate Generator
- Modular and synthesizable Verilog design
- Top-level UART integration
- Functional simulation and RTL verification in Vivado

---

## Project Structure

```
UART_Transceiver/
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
├── Baud_Rate_Generator/
│   ├── Design Files
│   └── RTL Schematic
│
└── README.md
```

---

## Module Overview

### UART Transmitter
- Serializes 8-bit parallel data
- Generates Start, Data, and Stop bits
- Busy signal indicates active transmission

### UART Receiver
- Detects incoming serial data
- Samples and reconstructs the received byte
- Outputs valid parallel data after successful reception

### Baud Rate Generator
- Generates baud enable signals from the system clock
- Used for timing synchronization between transmitter and receiver

### UART Top Module
- Integrates the transmitter, receiver, and baud rate generator
- Provides a complete UART communication interface

---

## Verification

Each module has been independently verified using dedicated testbenches in Vivado.

The repository includes:
- Verilog source files
- Testbenches
- RTL schematics
- Simulation waveforms

---

## Tools Used

- **Language:** Verilog HDL
- **EDA Tool:** Xilinx Vivado
- **Simulation:** Vivado Simulator

---

## Future Improvements

- Configurable data length
- Parity bit support
- Multiple stop bit options
- FIFO buffering
- Error detection (Framing, Parity, Overrun)
- Adjustable baud rate through parameters

---

## Author

**Om Patel**
- Electronics and Communication Engineering
- Nirma University
