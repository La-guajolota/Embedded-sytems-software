library IEEE;
use IEEE.std_logic_1164.all;

-- ==================================================================
-- File Name: DFF.vhdl
-- Description: 
--              This module implements a D flip-flop. On the rising edge
--              of the clock signal, the value of the `data` input is
--              latched into the output `q`. The output `q_not` is the
--              inverted value of `q`.
--
--              Qn+1 = D (on the rising edge of the clock)
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity DFF is
    port(
        data  : in std_logic;       -- Data input
        clk   : in std_logic;       -- Clock input
        q     : out std_logic;      -- Output
        q_not : out std_logic       -- Inverted output
    );
end DFF;

architecture behav of DFF is
    signal q_int : std_logic;       -- Internal signal to avoid latch inference
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q_int <= data;         -- Latch the `data` input on the rising edge of the clock
        end if;
    end process;

    q <= q_int;                     -- Drive the output `q` from the internal signal `q_int`
    q_not <= not q_int;            -- Drive the inverted output `q_not` from `q_int`
end behav;
