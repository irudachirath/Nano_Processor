----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 11:47:30 PM
-- Design Name: 
-- Module Name: TB_Adder_3_Bit - Behavioral
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

entity TB_Adder_3_Bit is
--  Port ( );
end TB_Adder_3_Bit;

architecture Behavioral of TB_Adder_3_Bit is

component Adder_3_Bit port( 
    A : in STD_LOGIC_VECTOR (2 downto 0);
    S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal a : std_logic_vector(2 downto 0) := "000";
signal s : std_logic_vector(2 downto 0);

begin

UUT: Adder_3_Bit port map(
    A => a,
    S => s);
    
--s <= "000";
--a <= "000";
Adder_3_Bit0 : process
    begin
        a <= "000";
        wait for 100ns;
        a <= s;
        wait for 100ns;
        a <= s;
        wait for 100ns;
        a <= s;
        wait for 100ns;
        a <= s;
        wait for 100ns; 
        a <= s;
        wait for 100ns;
        a <= s;
        wait for 100ns; 
        a <= s;
        wait for 100ns;
        a <= s;
        wait for 100ns; 
        a <= s;
        wait for 100ns;        
    end process;

end Behavioral;
