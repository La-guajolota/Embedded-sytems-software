library IEEE;
use IEEE.std_logic_1164.all;

-- ==================================================================
-- File Name: Parallel_In_Parallel_Out_8bit.vhdl
-- Description: This module implements an 8-bit parallel-in parallel-out 
--              register. It captures an 8-bit input (`i_data`) on the 
--              rising edge of the clock (`i_clk`) and outputs it on 
--              `o_Q`. The output reflects the value of `i_data` that 
--              was present at the last rising edge of the clock.
--
--              On the rising edge of `i_clk`, the input data `i_data` 
--              is latched into the output `o_Q`.
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity Parallel_In_Parallel_Out_8bit is
    port (
        i_clk : in std_logic;                      -- Clock input
        i_data : in std_logic_vector(7 downto 0);  -- 8-bit parallel data input
        o_Q     : out std_logic_vector(7 downto 0) -- 8-bit parallel data output
    );
end Parallel_In_Parallel_Out_8bit;

architecture register_type of Parallel_In_Parallel_Out_8bit is
begin

    parallel_register: process(i_clk)
    begin
        if rising_edge(i_clk) then
            o_Q <= i_data;   -- Latch input data into output on rising edge of clock
        end if;
    end process parallel_register;

end register_type;
