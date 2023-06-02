----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2023 12:45:55 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

component Slow_Clk port( 
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

signal clk_in, clk_out : std_logic;

begin

UUT: Slow_Clk port map(
    Clk_in => clk_in,
    Clk_out => clk_out);
    
Clock : process 
    begin
        clk_in <= '0';
        wait for 10ns;
        clk_in <= '1';
        wait for 10ns;
    end process;

end Behavioral;
