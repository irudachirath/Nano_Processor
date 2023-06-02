----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2023 03:07:23 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is
COMPONENT RCA_4
    PORT( C_in : IN STD_LOGIC;
          A, B : IN STD_LOGIC_VECTOR(3 downto 0);
          C_out, Zero : OUT STD_LOGIC;
          S : OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

signal c_in, c_out, zero : std_logic;
signal a, b, s : std_logic_vector(3 downto 0);

begin
UUT: RCA_4 PORT MAP(
    A => a,
    B => b,
    C_in => c_in,
    S => s,
    C_out => c_out,
    Zero => zero
);

process
begin
  a <= "0110"; -- set initial values
  b <= "0101";
  c_in <= '0';
 WAIT FOR 100 ns; -- after 100 ns change inputs
  a <= "0111"; -- set initial values
  b <= "0001";
 WAIT FOR 100 ns; --change again
  a <= "0100"; -- set initial values
  b <= "0011";
  c_in <= '1';
 WAIT FOR 100 ns; --change again
  a <= "0110"; -- set initial values
  b <= "0101";
 WAIT FOR 100 ns; --change again
  a <= "1110"; -- set initial values
  b <= "0101";
  c_in <= '0';
 WAIT FOR 100 ns; --change again
  a <= "1110"; -- set initial values
  b <= "0111";
  c_in <= '1';
 WAIT FOR 100 ns;
  a <= "0110"; -- set initial values
  b <= "1111";
 WAIT FOR 100 ns;
  a <= "0000"; -- set initial values
  b <= "0000";
  c_in <= '0';
 WAIT FOR 100 ns;
  a <= "0110"; -- set initial values
  b <= "0110";
  c_in <= '1';
 WAIT FOR 100 ns;
  a <= "0001"; -- set initial values
  b <= "1111";
  c_in <= '0';
 WAIT FOR 100 ns;
end process;

end Behavioral;
