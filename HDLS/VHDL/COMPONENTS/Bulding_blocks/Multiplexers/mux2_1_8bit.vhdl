library IEEE;
use IEEE.std_logic_1164.all;

-- ==================================================================
-- File Name: mux2_1_8bit.vhdl
-- Description: This module implements a 2-to-1 multiplexer with 8-bit wide 
--              inputs and outputs. The multiplexer selects between two 8-bit 
--              inputs (`i_A0` and `i_A1`) based on the value of the `i_Sel` 
--              selector input. When `i_Sel` is '0', the output `o_Y` is 
--              set to `i_A0`. When `i_Sel` is '1', the output `o_Y` is 
--              set to `i_A1`. This simple 2-to-1 multiplexer is useful for 
--              routing one of two 8-bit data paths to a single output.
--
--              o_Y = i_A0 when i_Sel = '0'
--              o_Y = i_A1 when i_Sel = '1'
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity mux2_1_8bit is
    port (
        -- INPUTS
        i_Sel : in std_logic;                -- Selector input (chooses between i_A0 and i_A1)
        i_A0   : in std_logic_vector(7 downto 0);  -- 8-bit input A
        i_A1   : in std_logic_vector(7 downto 0);  -- 8-bit input B
        -- OUTPUTS
        o_Y   : out std_logic_vector(7 downto 0)  -- 8-bit output
    );
end mux2_1_8bit;

architecture mux of mux2_1_8bit is 
begin
    -- Multiplexer operation based on selector input
    with i_Sel select
        o_Y <= i_A1 when '1',          -- If i_Sel is '1', output i_A1
               i_A0 when others;      -- If i_Sel is '0', output i_A0
end mux;