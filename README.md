# SECR1033-COMPUTER-ORGANIZATION-AND-ARCHITECTURE

# 💻 Computer Organization and Architecture (SECR1033) - Learning Portfolio & Project Reflection

Welcome to my portfolio for the **Computer Organization and Architecture (COA)** course.

---

## 📑 Overall Course Reflection

Computer Organization and Architecture completely shifted my perspective on software optimization by stripping away high-level abstractions and forcing me to program directly at the hardware layer. Writing assembly code using the Irvine32 library taught me exactly how data moves across general-purpose registers, how memory stacks handle control loops, and how mathematical equations transform into arithmetic logic unit instructions. Developing stress-testing applications and profiling system execution clocks showed me the hardware costs of every loop iteration, instruction latency, and memory access, which ultimately redefined how I write clean and efficient low-level software.

---

## 🛠️ Exercise-by-Exercise Reflection

### 🔹 [Lab 2: Arithmetic Equations & Basic Evaluation]
* **Concepts Focused:** Register allocation (`EAX`, `EBX`, `ECX`), basic mathematical operators (`ADD`, `SUB`, `IMUL`), and manual memory addressing.
* **Implementation Details:** Translated a series of high-level algebraic structures and multi-variable arithmetic equations into standalone x86 assembly scripts.
* **Reflection:** This lab forced me to move away from easy expressions and manage data manually across limited registers. I learned how data must be loaded, processed, and shifted across hardware channels without overwriting transient states.

### 🔹 [Lab 3 - Part 1C: Control Structures & Selection]
* **Concepts Focused:** Unconditional/conditional jumps (`JMP`, `JE`, `JNE`), comparison logic (`CMP`), and flow chart translation.
* **Implementation Details:** Programmed a selection system that evaluates multi-branch logic, moving data between execution paths based on runtime evaluation inputs.
* **Reflection:** Mapping out flowcharts into jump instructions demystified how high-level `if-else` loops operate under the hood. It highlighted how critical clear execution lines are to avoiding infinite stack errors.

### 🔹 [Lab 3 - Part 2C: Loop Decompositions & Iteration]
* **Concepts Focused:** Iteration registers (`ECX`), stack loops (`LOOP`), and hardware array tracking.
* **Implementation Details:** Designed a multi-pass loops processor that reads sequence limits dynamically, applies data modifications, and steps safely across consecutive memory allocations.
* **Reflection:** Working with low-level loops showed me how critical index targeting is. Managing bounds validation natively without helper functions significantly improved my defensive hardware programming skills.

---

## 🚀 Final Group Project Reflection: "CPU Benchmark Program"

### 📄 [Polynomial Evaluation Engine Architecture]
* **Concepts Covered:** Functional optimization, arithmetic stress testing, sub-routine execution tracking, and instruction-level runtime profiling.
* **Core Design:** Developed an x86 benchmarking console system that subjects processing units to mathematical stress loops by iteratively solving the cubic polynomial equation $y = 30x^3 + 11x^2 + 18x + 5$.
* **Reflection:** Writing code to stress test hardware using an equation highlighted how quickly nested operations pile up. Managing exponents and coefficient products using signed multiplication (`IMUL`) taught me the value of minimizing memory calls inside hot loops to maximize computing speeds.

### 📊 [Hardware Clocks & Performance Profiling]
* **Implementation Victory:** Engineered an execution clock tracking loop utilizing system timestamp queries (`GetMseconds`) to monitor hardware performance under heavy calculation spikes.
* **Mechanics Validation:** Successfully recorded raw baseline timestamps (`timeBefore`) and final processing timestamps (`timeAfter`) across parameterized user iteration bounds ($N$), cleanly isolating microsecond execution discrepancies (`diffTime`).
* **Reflection:** Catching physical millisecond updates in real time to calculate hardware strain was deeply rewarding. Seeing the runtime difference shift as we adjusted computation workloads mathematically proved how software design decisions affect concrete CPU execution and engine efficiency.
