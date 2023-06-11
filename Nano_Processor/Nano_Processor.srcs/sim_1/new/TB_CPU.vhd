----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:56:36 PM
-- Design Name: 
-- Module Name: TB_CPU - Behavioral
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

entity TB_CPU is
--  Port ( );
end TB_CPU;

architecture Behavioral of TB_CPU is


Component CPU 
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg_7_LED : out STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Component;

signal clk_in, res, overflow, zero : std_logic;
signal reg_7_led, anode_out : std_logic_vector(3 downto 0);
signal reg_7_7seg : std_logic_vector(6 downto 0);

begin

UUT : CPU port map (
       Clk_in => clk_in,
       Res => res,
       Reg_7_LED => reg_7_led,
       Anode_out => anode_out,
       Reg_7_7Seg => reg_7_7seg,
       Overflow => overflow,
       Zero => zero);
       
Clock : process 
    begin
        clk_in <= '0';
        wait for 2 ns;
        clk_in <= '1';
        wait for 2 ns;
end process;

process
    begin
        res <= '1';
        wait for 100 ns;
        res <= '0';
        wait;
 end process;
 
end Behavioral;
