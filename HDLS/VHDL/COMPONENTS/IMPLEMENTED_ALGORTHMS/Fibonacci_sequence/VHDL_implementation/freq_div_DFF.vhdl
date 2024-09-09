library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==================================================================
-- File Name: freq_div_DFF.vhdl
-- Description:
--              This module implements a frequency divider using a series of
--              D flip-flops. Each flip-flop divides the input clock frequency
--              by 2, resulting in a series of divided frequencies at the output
--              ports `FREQS`. The module uses 25 D flip-flops to achieve the 
--              required frequency divisions.
--
--              Frequency Divider Stages:
--              - FFD_0: Divides the input clock by 2 (13.5 MHz)
--              - FFD_1: Divides by 4 (6.75 MHz)
--              - FFD_2: Divides by 8 (3.375 MHz)
--              - Up to FFD_24 which generates a very low frequency (approximately 0.81 Hz)
--
-- Author: Adrian Silva Palafox
-- Date: September 8, 2024
-- ==================================================================

entity freq_div_DFF is
    port(
        CLK   : in std_logic;                -- Input clock signal
        FREQS : out std_logic_vector(0 to 24) -- Output frequency signals (0 to 24)
    );
end freq_div_DFF;

architecture STRUCT of freq_div_DFF is

    -- Component Declaration for the D Flip-Flop
    component DFF is
        port(
            data  : in std_logic;       -- Data input
            clk   : in std_logic;       -- Clock input
            q     : out std_logic;      -- Output
            q_not : out std_logic       -- Inverted output
        );
    end component;

    -- Internal signals for connecting flip-flops
    signal not_d: std_logic_vector(0 to 24); -- Internal signals for the flip-flops

begin
    
    -- Instantiate flip-flops to create a frequency divider chain
    ffd_0  : DFF port map(CLK, not_d(0), FREQS(0), not_d(0));    -- Divides by 2  --> 13.5 MHz
    ffd_1  : DFF port map(not_d(0), not_d(1), FREQS(1), not_d(1)); -- Divides by 4  --> 6.75 MHz
    ffd_2  : DFF port map(not_d(1), not_d(2), FREQS(2), not_d(2)); -- Divides by 8  --> 3.375 MHz
    ffd_3  : DFF port map(not_d(2), not_d(3), FREQS(3), not_d(3)); -- Divides by 16 --> 1.6875 MHz
    ffd_4  : DFF port map(not_d(3), not_d(4), FREQS(4), not_d(4)); -- Divides by 32 --> 843.75 kHz
    ffd_5  : DFF port map(not_d(4), not_d(5), FREQS(5), not_d(5)); -- Divides by 64 --> 421.875 kHz
    ffd_6  : DFF port map(not_d(5), not_d(6), FREQS(6), not_d(6)); -- Divides by 128 --> 210.9375 kHz
    ffd_7  : DFF port map(not_d(6), not_d(7), FREQS(7), not_d(7)); -- Divides by 256 --> 105.46875 kHz
    ffd_8  : DFF port map(not_d(7), not_d(8), FREQS(8), not_d(8)); -- Divides by 512 --> 52.734375 kHz
    ffd_9  : DFF port map(not_d(8), not_d(9), FREQS(9), not_d(9)); -- Divides by 1024 --> 26.3671875 kHz
    ffd_10 : DFF port map(not_d(9), not_d(10), FREQS(10), not_d(10)); -- Divides by 2048 --> 13.18359375 kHz
    ffd_11 : DFF port map(not_d(10), not_d(11), FREQS(11), not_d(11)); -- Divides by 4096 --> 6.591796875 kHz
    ffd_12 : DFF port map(not_d(11), not_d(12), FREQS(12), not_d(12)); -- Divides by 8192 --> 3.2958984375 kHz
    ffd_13 : DFF port map(not_d(12), not_d(13), FREQS(13), not_d(13)); -- Divides by 16384 --> 1.64794921875 kHz
    ffd_14 : DFF port map(not_d(13), not_d(14), FREQS(14), not_d(14)); -- Divides by 32768 --> 823.974609375 Hz
    ffd_15 : DFF port map(not_d(14), not_d(15), FREQS(15), not_d(15)); -- Divides by 65536 --> 411.9873046875 Hz
    ffd_16 : DFF port map(not_d(15), not_d(16), FREQS(16), not_d(16)); -- Divides by 131072 --> 205.99365234375 Hz
    ffd_17 : DFF port map(not_d(16), not_d(17), FREQS(17), not_d(17)); -- Divides by 262144 --> 102.996826171875 Hz
    ffd_18 : DFF port map(not_d(17), not_d(18), FREQS(18), not_d(18)); -- Divides by 524288 --> 51.4984130859375 Hz
    ffd_19 : DFF port map(not_d(18), not_d(19), FREQS(19), not_d(19)); -- Divides by 1048576 --> 25.74920654296875 Hz
    ffd_20 : DFF port map(not_d(19), not_d(20), FREQS(20), not_d(20)); -- Divides by 2097152 --> 12.874603271484375 Hz
    ffd_21 : DFF port map(not_d(20), not_d(21), FREQS(21), not_d(21)); -- Divides by 4194304 --> 6.4373016357421875 Hz
    ffd_22 : DFF port map(not_d(21), not_d(22), FREQS(22), not_d(22)); -- Divides by 8388608 --> 3.2186508178710938 Hz
    ffd_23 : DFF port map(not_d(22), not_d(23), FREQS(23), not_d(23)); -- Divides by 16777216 --> 1.6093254089355469 Hz
    ffd_24 : DFF port map(not_d(23), not_d(24), FREQS(24), not_d(24)); -- Divides by 33554432 --> 0.8046627044677734 Hz

end STRUCT;
