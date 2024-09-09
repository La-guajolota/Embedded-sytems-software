library IEEE;
use IEEE.std_logic_1164.all;

-- ==================================================================
-- File Name: rcadder_8bit.vhdl
-- Description: This module implements an 8-bit ripple-carry adder. It 
--              takes three 8-bit inputs: `i_x`, `i_y`, and `i_cin` 
--              (carry-in). It produces two outputs: `o_s` (sum) and `o_cout`
--              (carry-out). The adder is constructed using eight 1-bit 
--              full adder components connected in series.
--
--              Sum (o_s) = i_x + i_y + i_cin
--              Carry-out (o_cout) is the final carry-out from the most 
--              significant bit full adder.
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity rcadder_8bit is
    port (
        i_cin : in std_logic;                  -- Carry-in input for the adder
        i_x   : in std_logic_vector(7 downto 0); -- 8-bit input vector x
        i_y   : in std_logic_vector(7 downto 0); -- 8-bit input vector y
        o_s   : out std_logic_vector(7 downto 0); -- 8-bit sum output
        o_cout : out std_logic -- Final carry-out output
    );
end rcadder_8bit;

architecture ripple_behavior of rcadder_8bit is

    signal s_c : std_logic_vector(0 to 7); -- Internal carry signals between full adders
    
    component full_adder_1bit
        port(
            a    : in std_logic;    -- First input bit
            b    : in std_logic;    -- Second input bit
            cin  : in std_logic;    -- Carry-in input
            s    : out std_logic;   -- Sum output
            cout : out std_logic    -- Carry-out output
        );
    end component;    

begin

    -- Connect 1-bit full adders in series to form an 8-bit ripple-carry adder
    fulladder0 : full_adder_1bit port map(i_x(0), i_y(0), i_cin, o_s(0), s_c(0));
    fulladder1 : full_adder_1bit port map(i_x(1), i_y(1), s_c(0), o_s(1), s_c(1));
    fulladder2 : full_adder_1bit port map(i_x(2), i_y(2), s_c(1), o_s(2), s_c(2));
    fulladder3 : full_adder_1bit port map(i_x(3), i_y(3), s_c(2), o_s(3), s_c(3));
    fulladder4 : full_adder_1bit port map(i_x(4), i_y(4), s_c(3), o_s(4), s_c(4));
    fulladder5 : full_adder_1bit port map(i_x(5), i_y(5), s_c(4), o_s(5), s_c(5));
    fulladder6 : full_adder_1bit port map(i_x(6), i_y(6), s_c(5), o_s(6), s_c(6));
    fulladder7 : full_adder_1bit port map(i_x(7), i_y(7), s_c(6), o_s(7), o_cout);

end ripple_behavior;