library IEEE;
use IEEE.std_logic_1164.all;

-- ==================================================================
-- File Name: DFF_SR.vhdl
-- Description: This module implements a D flip-flop with both asynchronous
--              set and reset functionalities. On the rising edge of the clock,
--              the value of input `data` is latched into the output `q`. The 
--              `asetn` input asynchronously sets `q` to '1', and the `arst` input 
--              asynchronously resets `q` to '0'.
--                              
--              Qn+1 = D              
--
-- Author: Adrian Silva Palafox
-- Date: September 7, 2024
-- ==================================================================

entity DFF_SR is
    port(
        data  : in std_logic;       -- Data input
        clk   : in std_logic;       -- Clock input
        arst  : in std_logic;       -- Asynchronous reset input (active high)
        asetn : in std_logic;       -- Asynchronous set input (active low)
        q     : out std_logic;       -- Output
        q_not : out std_logic
    );
end DFF_SR;

architecture behav of DFF_SR is
    signal q_int : std_logic;       -- Internal signal to avoid latch inference
begin
    process(clk, arst, asetn)
    begin
        if asetn = '0' then
            q_int <= '1';           -- Asynchronous set: Set internal `q_int` to '1'
        elsif arst = '1' then
            q_int <= '0';           -- Asynchronous reset: Set internal `q_int` to '0'
        elsif rising_edge(clk) then
            q_int <= data;         -- Latch the `data` input on the rising edge of the clock
        end if;
    end process;

    q <= q_int;                     -- Drive the output `q` from the internal signal `q_int`
    q_not <= not q_int;
end behav;
