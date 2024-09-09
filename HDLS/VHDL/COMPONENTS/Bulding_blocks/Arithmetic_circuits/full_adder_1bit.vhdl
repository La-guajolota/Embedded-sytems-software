library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- ==================================================================
-- File Name: full_adder_1bit.vhdl
-- Description: This module implements a 1-bit full adder. It takes three 
--              inputs: `a`, `b`, and `cin` (carry-in), and produces two 
--              outputs: `s` (sum) and `cout` (carry-out). The full adder
--              calculates the sum of the inputs and the carry-out based on
--              the logic of binary addition.
--
--              Sum (s) = (a XOR b) XOR cin
--              Carry-out (cout) = (a AND b) OR ((a XOR b) AND cin)
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity full_adder_1bit is
    port (
        a    : in std_logic;   -- First input bit
        b    : in std_logic;   -- Second input bit
        cin  : in std_logic;   -- Carry-in input
        s    : out std_logic;  -- Sum output
        cout : out std_logic   -- Carry-out output
    );
end full_adder_1bit;

architecture synth of full_adder_1bit is
    signal p, g : std_logic;  -- Intermediate signals for partial results
begin
    -- Calculate partial sum (p) and generate (g) signals
    p <= a xor b;            -- Partial sum of inputs a and b
    g <= a and b;            -- Generate signal for carry-out calculation

    -- Calculate sum and carry-out
    s <= p xor cin;          -- Sum output
    cout <= g or (p and cin);-- Carry-out output
end synth;
