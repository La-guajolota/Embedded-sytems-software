library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--******************************************************************************
-- Filename: tristate_array.vhdl
-- Project: Generic Tri-State Buffer
-- Description: 
--   A tri-state buffer component that conditionally drives an output with
--   the input data or sets it to high impedance based on a control signal.
--   When the control signal (`i_state`) is '0', the output (`o_data`) 
--   mirrors the input data (`i_data`). When `i_state` is '1', the output 
--   is set to high impedance ('Z').
-- 
-- Generic Parameters:
--   g_bits_len : integer
--     Length of the bit vector for input and output signals. The default
--     value is 6.
-- 
-- Ports:
--   i_data  : in std_logic_vector(g_bits_len - 1 downto 0)
--     Input data vector to be tri-stated.
--   i_state : in std_logic
--     Control signal that determines whether the output follows the input
--     or is set to high impedance. A value of '0' enables the output, 
--     while a value of '1' disables it.
--   o_data  : out std_logic_vector(g_bits_len - 1 downto 0)
--     Output data vector which is either driven by `i_data` or set to 
--     high impedance ('Z') based on `i_state`.
-- 
-- Author: Adrian Silva Palafox
-- Date:   9/7/2024
-- Version: 1.0
--******************************************************************************
entity tristate_array is
  generic (
    g_bits_len : integer := 6  -- Length of the bit vector (default 6)
  );  

  port (
    -- Input data signal
    i_data  : in std_logic_vector(g_bits_len - 1 downto 0);  -- Data to be tri-stated
    
    -- Control signal for tri-state operation
    i_state : in std_logic;  -- Control signal to enable/disable output
    
    -- Output data signal
    o_data  : out std_logic_vector(g_bits_len - 1 downto 0)  -- Tri-stated output data
  );
end tristate_array;

--******************************************************************************
-- Architecture: Behavioral
-- Description:
--   Implements a tri-state buffer functionality. The output data follows
--   the input data when the control signal `i_state` is '0'. When `i_state`
--   is '1', the output data is set to high impedance ('Z').
--******************************************************************************
architecture Behavioral of tristate_array is
begin
  -- Process block for tri-state control
  process (i_data, i_state)
  begin
    if i_state = '0' then
      o_data <= i_data;  -- Output mirrors input data when state is '0'
    else
      o_data <= (others => 'Z');  -- Set output to high impedance when state is not '0'
    end if;
  end process;
end Behavioral;
