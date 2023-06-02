----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2023 11:41:18 PM
-- Design Name: 
-- Module Name: MUX_2_1_3Bit - Behavioral
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

entity MUX_2_1_4Bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_1_4Bit;

architecture Behavioral of MUX_2_1_4Bit is

begin
Y(0) <= (A(0) AND (NOT S)) OR (B(0) AND  S);
Y(1) <= (A(1) AND (NOT S)) OR (B(1) AND  S);
Y(2) <= (A(2) AND (NOT S)) OR (B(2) AND  S);
Y(3) <= (A(3) AND (NOT S)) OR (B(3) AND  S);

end Behavioral;
