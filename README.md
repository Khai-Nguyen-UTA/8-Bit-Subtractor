This project is a hardware implementation of an 8-bit ripple carry adder/subtractor using Verilog. The system is composed of two main modules: SubTL8 (the top-level module) and RCAddSub (a lower-level ripple carry adder/subtractor module). Each of these modules performs a specific function in the overall design of the arithmetic circuit.

Top-Level Module: SubTL8
The SubTL8 module is responsible for performing 8-bit subtraction. It accepts two 8-bit inputs, A and B, and produces an 8-bit result, solution, along with a carry-out signal Cout. The main task of this module is to ensure that the subtraction is done properly and to handle two's complement representation for signed operations.

RCAddSub Instantiation: Inside the SubTL8 module, an instance of the RCAddSub module is created to handle the actual addition or subtraction. In this case, the AddSub signal is set to 1, meaning the circuit is configured to perform subtraction (A - B).
Two's Complement Conversion (twoSign): After the subtraction operation, the result (out) is passed to a two's complement converter module, twoSign, which processes the output to ensure proper signed representation when needed. The final result (outFinal) is selected based on the Coutwire signal. If Coutwire is 0, it indicates no overflow, and outFinal is selected. Otherwise, the unprocessed output out is used.
The SubTL8 module thus performs subtraction while handling signed inputs and adjusting the output based on the carry-out to represent the result properly.

Lower-Level Module: RCAddSub
The RCAddSub module is the core arithmetic unit that implements an 8-bit ripple carry adder/subtractor. It performs the actual addition or subtraction based on the control signal AddSub (which is set to 1 for subtraction).

Adder/Subtractor Selection: The input AddSub controls whether the operation is addition or subtraction. In this project, the value is hardcoded to 1 in the SubTL8 module, configuring it for subtraction.
Ripple Carry Logic: The module instantiates 8 full adders (FAbehavSV instances), each corresponding to a bit of the operands. The carry-out of each full adder is propagated to the next stage, creating a ripple carry effect. The final carry-out, Cout, is taken from the last stage of the adder.
Bitwise XOR for Subtraction: For subtraction, the bits of B are XORed with the AddSub signal, effectively transforming the operation into A + (~B + 1), which is the two’s complement form of subtraction.
In essence, the RCAddSub module functions as the core of the arithmetic process, performing either addition or subtraction through a chain of full adders. This result is then processed and adjusted at the top level by the SubTL8 module.

Overall Functionality
The project takes two 8-bit inputs, A and B, and performs subtraction using ripple carry logic. The result is adjusted based on two’s complement rules for signed numbers. The top-level module, SubTL8, manages the entire process, while RCAddSub handles the bitwise arithmetic. The twoSign module ensures the correct signed interpretation of the result, and the carry-out (Cout) determines how the final output is represented. This structure ensures efficient and accurate subtraction in both signed and unsigned forms.
