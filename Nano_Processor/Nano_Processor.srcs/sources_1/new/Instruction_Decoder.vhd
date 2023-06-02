----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:44:38 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( IB : in STD_LOGIC_VECTOR (11 downto 0);
           R_Val : in STD_LOGIC_VECTOR (3 downto 0);
           RA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           RB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Ad : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

RA_Sel <= IB(9 downto 7);
RB_Sel <= IB(6 downto 4);
Load_Sel <= IB(11) AND (NOT IB(10));
Im_Val <= IB(3 downto 0);
Add_Sub_Sel <= IB(10) AND (NOT IB(11));
Jump_Flag <= NOT(R_Val(0) OR R_Val(1) OR R_Val(2) OR R_Val(3)) AND (IB(11) AND IB(10));
Jump_Ad <= IB(2 downto 0);

end Behavioral;
