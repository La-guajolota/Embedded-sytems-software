library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--******************************************************************************
-- Filename: BCD_counter.vhdl
-- Project: BCD Counter
-- Description: 
--   A Binary-Coded Decimal (BCD) counter that counts from 0 to 9. The counter 
--   increments on the rising edge of the clock (`i_clk`) if enabled (`i_count_ena`) 
--   and not reset. The counter can be reset asynchronously by `i_rstb` or 
--   synchronously by `i_sync_reset`.
-- 
-- Ports:
--   i_clk          : in  std_logic
--     Clock input for the counter.
--   i_rstb         : in  std_logic
--     Asynchronous active-low reset signal.
--   i_sync_reset   : in  std_logic
--     Synchronous reset signal. When asserted, the counter resets to 0.
--   i_count_ena    : in  std_logic
--     Counter enable signal. When asserted, the counter increments on the 
--     rising edge of `i_clk`.
--   o_bcd          : out std_logic_vector(3 downto 0)
--     4-bit BCD output representing the counter value.
-- 
-- Author: Adrian Silva Palafox
-- Date:   [9/7/2024]
-- Version: 1.0
--******************************************************************************
entity BCD_counter is
  port (
    i_clk          : in  std_logic;          -- Clock input
    i_rstb         : in  std_logic;          -- Asynchronous reset (active low)
    i_sync_reset   : in  std_logic;          -- Synchronous reset
    i_count_ena    : in  std_logic;          -- Count enable
    o_bcd          : out std_logic_vector(3 downto 0)  -- BCD output
  );
end BCD_counter;

architecture rtl of BCD_counter is
  signal r_count : unsigned(3 downto 0) := (others => '0');  -- 4-bit counter register

begin

  -- Output assignment
  o_bcd <= std_logic_vector(r_count);

  -- Counter process
  p_count : process(i_clk, i_rstb)
  begin
    if (i_rstb = '0') then
      -- Asynchronous reset: reset counter to 0
      r_count <= (others => '0');
    elsif (rising_edge(i_clk)) then
      if (i_sync_reset = '1') then
        -- Synchronous reset: reset counter to 0
        r_count <= (others => '0');
      elsif (i_count_ena = '1') then
        -- Counter enable is high; increment counter or reset to 0 if limit is reached
        if (r_count = 9) then
          r_count <= (others => '0');
        else
          r_count <= r_count + 1;
        end if;
      end if;
    end if;
  end process p_count;

end rtl;
