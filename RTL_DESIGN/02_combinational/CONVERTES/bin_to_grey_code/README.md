# Binary to Gray Code Converter

## 📌 Overview

The **Binary to Gray Code Converter** is a combinational digital circuit that converts an `N-bit Binary number` into its equivalent `N-bit Gray Code`.

Gray Code is a binary numeral system in which **two consecutive values differ by only one bit**. This property makes Gray Code useful in applications where minimizing transition errors is important.

This project implements a Binary-to-Gray Code converter using **Verilog HDL** and verifies its functionality through simulation.

The design is completely **combinational**, meaning that the output depends only on the current input and does not require:

* Clock
* Reset
* Flip-flops
* Memory
* State machine

---

# 🎯 Objectives

The main objectives of this project are:

* Understand Binary-to-Gray Code conversion.
* Design a combinational circuit using logic gates.
* Derive Boolean equations from the conversion rule.
* Implement the design using Verilog HDL.
* Create a synthesizable RTL design.
* Develop a Verilog testbench.
* Verify all possible input combinations.
* Analyze RTL simulation waveforms.
* Synthesize the design using FPGA tools such as Xilinx Vivado.
* Understand the relationship between Boolean logic and FPGA hardware implementation.
* Document the complete RTL design flow using Git and GitHub.

---

# 📚 What is Gray Code?

Gray Code, also called **Reflected Binary Code**, is a binary numbering system where adjacent numbers differ by exactly one bit.

For example:

### Binary

```text
000
001
010
011
100
101
110
111
```

### Gray Code

```text
000
001
011
010
110
111
101
100
```

Notice that consecutive Gray Code values change by only **one bit**.

For example:

```text
001 → 011
```

Only one bit changes.

Another example:

```text
011 → 010
```

Again, only one bit changes.

---

# 🔄 Binary to Gray Conversion Principle

For an `N-bit` binary number:

```text
Binary = B[N-1 : 0]
Gray   = G[N-1 : 0]
```

The most significant Gray bit is equal to the most significant Binary bit:

```text
G[N-1] = B[N-1]
```

Every remaining Gray bit is obtained by XORing two adjacent Binary bits:

```text
G[i] = B[i+1] XOR B[i]
```

Therefore:

```text
G[N-1] = B[N-1]

G[N-2] = B[N-1] XOR B[N-2]

G[N-3] = B[N-2] XOR B[N-3]

...

G[0] = B[1] XOR B[0]
```

---

# 🧮 4-Bit Binary to Gray Conversion

For a 4-bit input:

```text
Binary = B3 B2 B1 B0
Gray   = G3 G2 G1 G0
```

The equations are:

```text
G3 = B3

G2 = B3 XOR B2

G1 = B2 XOR B1

G0 = B1 XOR B0
```

Therefore:

```text
Gray = B3 (B3 XOR B2) (B2 XOR B1) (B1 XOR B0)
```

---

# 📋 Truth Table

For a 4-bit Binary-to-Gray converter:

| Decimal | Binary | Gray |
| ------: | :----: | :--: |
|       0 |  0000  | 0000 |
|       1 |  0001  | 0001 |
|       2 |  0010  | 0011 |
|       3 |  0011  | 0010 |
|       4 |  0100  | 0110 |
|       5 |  0101  | 0111 |
|       6 |  0110  | 0101 |
|       7 |  0111  | 0100 |
|       8 |  1000  | 1100 |
|       9 |  1001  | 1101 |
|      10 |  1010  | 1111 |
|      11 |  1011  | 1110 |
|      12 |  1100  | 1010 |
|      13 |  1101  | 1011 |
|      14 |  1110  | 1001 |
|      15 |  1111  | 1000 |

---

# 🔍 Example Conversion

Consider:

```text
Binary = 1011
```

Separate the bits:

```text
B3 = 1
B2 = 0
B1 = 1
B0 = 1
```

Apply the equations:

```text
G3 = B3
   = 1

G2 = B3 XOR B2
   = 1 XOR 0
   = 1

G1 = B2 XOR B1
   = 0 XOR 1
   = 1

G0 = B1 XOR B0
   = 1 XOR 1
   = 0
```

Therefore:

```text
Binary = 1011
Gray   = 1110
```

---

# 🧠 Logic Diagram

The 4-bit converter requires:

* 1 direct connection
* 3 XOR gates

Conceptually:

```text
                 ┌───────────────┐
B3 ─────────────►│               │
                 │      XOR      ├────── G2
B2 ─────────────►│               │
                 └───────────────┘

                 ┌───────────────┐
B2 ─────────────►│               │
                 │      XOR      ├────── G1
B1 ─────────────►│               │
                 └───────────────┘

                 ┌───────────────┐
B1 ─────────────►│               │
                 │      XOR      ├────── G0
B0 ─────────────►│               │
                 └───────────────┘

B3 ───────────────────────────────────── G3
```

Simplified:

```text
B3 ───────────────────────────────► G3
 │
 │
 ├─────────┐
           XOR ───────────────────► G2
B2 ────────┘

B2 ────────┐
           XOR ───────────────────► G1
B1 ────────┘

B1 ────────┐
           XOR ───────────────────► G0
B0 ────────┘
```

---

# 🔧 Gate-Level Implementation

The circuit consists of:

```text
Number of XOR gates = N - 1

Number of direct connections = 1
```

For a 4-bit converter:

```text
XOR gates = 4 - 1
          = 3
```

Hardware structure:

```text
             Binary Input
             B3 B2 B1 B0
              │  │  │  │
              │  │  │  │
              │  │  │  │
              │  │  │  │
              │  │  │  │
              │  │  │  │
              │  │  │  │
              │  │  │  │
              ▼  ▼  ▼  ▼

              ┌────────┐
B3 ──────────►│        │────────► G3
              │ DIRECT │
              └────────┘

B3 ─────┐
        XOR ─────────────────────► G2
B2 ─────┘

B2 ─────┐
        XOR ─────────────────────► G1
B1 ─────┘

B1 ─────┐
        XOR ─────────────────────► G0
B0 ─────┘

             Gray Output
             G3 G2 G1 G0
```

---

# 💡 Why XOR is Used

The XOR operation produces `1` when its two inputs are different.

| A | B | A XOR B |
| - | - | ------- |
| 0 | 0 | 0       |
| 0 | 1 | 1       |
| 1 | 0 | 1       |
| 1 | 1 | 0       |

This is exactly what is required for Gray Code conversion.

Each Gray bit compares two adjacent Binary bits.

For example:

```text
B3 B2

1  0
   ↓
1 XOR 0 = 1
```

Therefore:

```text
G2 = 1
```

---

# 🏗️ Design Type

This circuit is a:

```text
COMBINATIONAL CIRCUIT
```

There is no:

```text
Clock
Reset
Register
Flip-Flop
Memory
FSM
```

The relationship is simply:

```text
Binary Input
     │
     ▼
Combinational Logic
     │
     ▼
Gray Output
```

---

# ⏱️ Timing Concept

Since the circuit is combinational, the output changes when the input changes.

Conceptually:

```text
Binary Input
     │
     │
     ▼
    XOR
     │
     ▼
Gray Output
```

There is a small physical propagation delay through the XOR logic.

In an FPGA implementation, Vivado maps the XOR operations into the FPGA's configurable logic resources.

---

# 🧩 RTL Architecture

The RTL architecture can be represented as:

```text
             ┌──────────────────────┐
             │ Binary-to-Gray       │
             │ Converter            │
             │                      │
Binary[3:0] ─►  Combinational Logic ├──► Gray[3:0]
             │                      │
             └──────────────────────┘
```

For a parameterized design:

```text
Binary[N-1:0]
       │
       ▼
┌─────────────────┐
│ XOR Conversion  │
│ Logic           │
└────────┬────────┘
         │
         ▼
Gray[N-1:0]
```

---

# 💻 Verilog Design

A simple 4-bit RTL implementation can be written using continuous assignments:

```verilog
module bin_to_gray (
    input  [3:0] bin,
    output [3:0] gray
);

assign gray[3] = bin[3];
assign gray[2] = bin[3] ^ bin[2];
assign gray[1] = bin[2] ^ bin[1];
assign gray[0] = bin[1] ^ bin[0];

endmodule
```

This directly represents the Boolean equations.

---

# 🔬 Alternative RTL Description

The conversion can also be represented compactly as:

```verilog
assign gray = bin ^ (bin >> 1);
```

This follows the mathematical relationship:

```text
Gray = Binary XOR (Binary >> 1)
```

Both implementations represent the same combinational function.

For learning RTL design, the individual equations are useful because they clearly show the underlying hardware logic.

---

# 🧪 Verification

The design should be verified using a Verilog testbench.

The testbench should:

1. Generate every possible input.
2. Apply the input to the DUT.
3. Calculate the expected Gray Code.
4. Compare expected and actual outputs.
5. Report PASS/FAIL.
6. Stop the simulation after all combinations are tested.

For a 4-bit converter:

```text
Number of possible inputs = 2^4

                         = 16
```

Therefore, all 16 combinations should be tested.

---

# 🧪 Verification Strategy

```text
             Testbench
                 │
                 ▼
        ┌─────────────────┐
        │ Generate Input  │
        └────────┬────────┘
                 │
                 ▼
             Binary
                 │
                 ▼
        ┌─────────────────┐
        │       DUT       │
        │ Binary → Gray   │
        └────────┬────────┘
                 │
                 ▼
              Gray
                 │
                 ▼
        ┌─────────────────┐
        │ Expected Value  │
        │ Comparison      │
        └────────┬────────┘
                 │
          ┌──────┴──────┐
          ▼             ▼
        PASS           FAIL
```

---

# 📊 Expected Simulation

For example:

```text
Input     Output

0000  →   0000
0001  →   0001
0010  →   0011
0011  →   0010
0100  →   0110
0101  →   0111
...
1111  →   1000
```

The waveform should show that every change in Binary input produces the corresponding Gray Code output.

---

# ✅ Verification Checklist

| Test   | Expected Result |
| ------ | --------------- |
| `0000` | `0000`          |
| `0001` | `0001`          |
| `0010` | `0011`          |
| `0011` | `0010`          |
| `0100` | `0110`          |
| `0101` | `0111`          |
| `0110` | `0101`          |
| `0111` | `0100`          |
| `1000` | `1100`          |
| `1001` | `1101`          |
| `1010` | `1111`          |
| `1011` | `1110`          |
| `1100` | `1010`          |
| `1101` | `1011`          |
| `1110` | `1001`          |
| `1111` | `1000`          |

---

# 🖥️ FPGA Implementation Flow

The design can be implemented on an FPGA using the following flow:

```text
Verilog RTL
     │
     ▼
Create Vivado Project
     │
     ▼
Add RTL Sources
     │
     ▼
Add Testbench
     │
     ▼
Behavioral Simulation
     │
     ▼
Synthesis
     │
     ▼
RTL / Netlist Analysis
     │
     ▼
Implementation
     │
     ▼
Timing Analysis
     │
     ▼
Generate Bitstream
     │
     ▼
Program FPGA
```

---

# 🔌 FPGA Hardware Demonstration

A simple hardware demonstration can use:

```text
FPGA Board
     │
     ├── Switches → Binary Input
     │
     └── LEDs ← Gray Output
```

Example:

```text
Switches
B3 B2 B1 B0
 │  │  │  │
 ▼  ▼  ▼  ▼
┌─────────────────┐
│ Binary → Gray   │
│ Converter       │
└────────┬────────┘
         │
         ▼
     G3 G2 G1 G0
         │
         ▼
       LEDs
```

For example:

```text
Switch input:

1011

FPGA output:

1110
```

The LEDs should therefore represent:

```text
G3 G2 G1 G0
1  1  1  0
```

---

# 📈 FPGA Resource Expectations

Because this is a very small combinational circuit, the hardware resource requirement is extremely low.

For a 4-bit implementation, the logical requirement is approximately:

```text
XOR gates       = 3
Direct routing  = 1
```

The exact FPGA LUT/resource utilization depends on the target FPGA architecture and synthesis optimization.

Important FPGA reports to observe:

* LUT utilization
* Flip-flop utilization
* I/O utilization
* Timing
* Power estimation

---

# 📁 Recommended Folder Structure

```text
bin_to_gray/
│
├── rtl/
│   ├── bin_to_gray.v
│   └── bin_to_gray_gate.v
│
├── tb/
│   └── bin_to_gray_tb.v
│
├── constraints/
│   └── bin_to_gray.xdc
│
├── docs/
│   ├── truth_table.md
│   ├── logic_equations.md
│   └── architecture.md
│
├── simulation/
│   └── waveform.png
│
├── README.md
│
└── LICENSE
```

---

# 🔀 Possible RTL Modeling Styles

This project can be implemented using multiple Verilog modeling approaches.

## 1. Gate-Level Modeling

Use XOR gates explicitly.

Conceptually:

```text
XOR
XOR
XOR
```

This is useful for understanding how the Boolean equation maps to gates.

---

## 2. Dataflow Modeling

Use Boolean equations:

```verilog
assign gray[3] = bin[3];
assign gray[2] = bin[3] ^ bin[2];
assign gray[1] = bin[2] ^ bin[1];
assign gray[0] = bin[1] ^ bin[0];
```

This is a direct representation of the logic.

---

## 3. Behavioral Modeling

The conversion can also be described procedurally using an `always_comb` block.

This approach is useful for learning different RTL coding styles.

---

# 📚 Concepts Learned

This project demonstrates several fundamental RTL concepts:

### Digital Logic

* XOR gate
* Boolean equations
* Truth tables
* Combinational logic

### Verilog

* Module declaration
* Input/output ports
* Continuous assignment
* Bit-select
* Vector operations
* XOR operator
* Combinational `always` blocks

### FPGA

* RTL synthesis
* LUT implementation
* I/O constraints
* Bitstream generation
* FPGA programming
* Timing analysis

### Verification

* Testbench creation
* Stimulus generation
* Expected-value calculation
* Automatic comparison
* Waveform analysis
* Exhaustive testing

### Git/GitHub

* Repository organization
* Meaningful commits
* Version control
* Documentation
* RTL project management

---

# 🚀 Possible Extensions

After completing the basic 4-bit converter, the design can be extended.

## 1. Parameterized Binary-to-Gray Converter

Instead of fixing the design to 4 bits:

```text
4-bit
8-bit
16-bit
32-bit
```

can be supported using a parameterized module.

---

## 2. Gray-to-Binary Converter

Create the reverse conversion:

```text
Gray
 ↓
Gray-to-Binary
 ↓
Binary
```

---

## 3. Binary ↔ Gray Converter System

Build a complete system:

```text
             ┌────────────────┐
Binary ─────►│ Binary → Gray  │────► Gray
             └────────────────┘

             ┌────────────────┐
Gray ───────►│ Gray → Binary  │────► Binary
             └────────────────┘
```

---

## 4. FPGA Hardware Demonstration

Use:

```text
Switches
   ↓
Binary-to-Gray
   ↓
LEDs
```

This provides a simple physical demonstration.

---

# 🎓 Why Gray Code is Important

Gray Code is used in several digital systems because only one bit changes between adjacent values.

Applications include:

* Rotary encoders
* Position encoders
* Analog-to-digital converter interfaces
* Karnaugh maps
* Communication systems
* Error reduction in asynchronous interfaces
* Clock-domain crossing techniques
* FIFO pointer synchronization

One particularly important VLSI application is **asynchronous FIFO design**, where Gray-coded read/write pointers are commonly used to safely communicate pointer information across clock domains.

---

# 📌 Key Formula

For an N-bit Binary number:

```text
Gray[N-1] = Binary[N-1]

Gray[i] = Binary[i+1] XOR Binary[i]
```

or equivalently:

```text
Gray = Binary XOR (Binary >> 1)
```

---

# 🏁 Conclusion

The Binary-to-Gray Code Converter is a fundamental combinational logic design that provides a good starting point for learning RTL design and FPGA implementation.

The project demonstrates the complete basic digital-design workflow:

```text
Specification
     ↓
Truth Table
     ↓
Boolean Equations
     ↓
Logic Diagram
     ↓
RTL Design
     ↓
Testbench
     ↓
Simulation
     ↓
Synthesis

     ↓
Implementation
     ↓
FPGA Hardware
     ↓
GitHub Documentation
```

Although the circuit itself is simple, it establishes the fundamental concepts required for larger RTL designs.

---

# 👨‍💻 Project Status

```text
[✓] Specification
[✓] Truth Table
[✓] Boolean Equations
[✓] Logic Design
[✓] RTL Design
[✓] Testbench
[ ] Simulation
[ ] Synthesis
[ ] Timing Analysis
[ ] FPGA Implementation
[ ] Hardware Verification
[ ] Final Documentation
```

---

# 📖 References

* Digital Logic Design fundamentals
* Verilog HDL language reference
* AMD/Xilinx Vivado Design Suite documentation
* FPGA device documentation
* Gray Code / Reflected Binary Code fundamentals

---

## Author

**Ganesh Prabhu R.**

Electronics and Communication Engineering

Focus: RTL Design | Verilog | FPGA | VLSI
