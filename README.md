Verilog Clock Divider Module - 
Haim Ozer
===============================
---------------

## Description
A Verilog module for generating a divided clock signal with adjustable output frequencies based on a 2-bit input.

## Overview
This project includes a clock divider module (ClockDivider) that can produce output clock signals at different frequencies by selecting one of four predefined division ratios via a 2-bit input.

## Project Structure
**ex3**: Top-level module that instantiates the ClockDivider module.
**ClockDivider**: The core module that performs clock division based on the input value.
Usage

### Input:
**clk**: The input clock signal.
**reset**: Asynchronous reset signal.
**div[1:0]**: 2-bit input for selecting the clock division ratio.
### Output:
**div_clk**: Divided clock output.

### Clock Division Settings
- 00 : 100 Hz
- 01 : 1 kHz
- 10 : 10 kHz
- 11 : 100 kHz

## Initial Setup
Upon reset, the counter and divided clock signal are initialized to their default states.
