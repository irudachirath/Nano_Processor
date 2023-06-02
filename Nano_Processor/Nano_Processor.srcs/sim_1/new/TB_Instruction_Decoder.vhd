----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 04:12:54 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder Port ( 
           IB : in STD_LOGIC_VECTOR (11 downto 0);
           R_Val : in STD_LOGIC_VECTOR (3 downto 0);
           RA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           RB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Ad : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal IB : std_logic_vector(11 downto 0);
signal R_Val, Im_Val : std_logic_vector(3 downto 0);
signal RA_Sel, RB_Sel, Jump_Ad : std_logic_vector(2 downto 0);
signal Load_Sel, Add_Sub_Sel, Jump_Flag : std_logic;

begin

UUT : Instruction_Decoder port map(
    IB => IB,
    R_Val => R_Val,
    RA_Sel => RA_Sel,
    RB_Sel => RB_Sel,
    Load_Sel => Load_Sel,
    Im_Val => Im_Val,
    Add_Sub_Sel => Add_Sub_Sel,
    Jump_Flag => Jump_Flag,
    Jump_Ad => Jump_Ad);
    
Adder_3_Bit0 : process
        begin
            IB <= "101010001010";
            R_Val <= "0000";
            wait for 100ns;
            IB <= "101110000010";
            R_Val <= "0000";
            wait for 100ns;
            IB <= "001011110000";
            R_Val <= "1010";
            wait for 100ns;
            IB <= "100110001110";
            R_Val <= "0000";
            wait for 100ns;
            IB <= "011010000000";
            R_Val <= "1100";
            wait for 100ns; 
            IB <= "111100000010";
            R_Val <= "0000";
            wait for 100ns;
            IB <= "111110000011";
            R_Val <= "0010";
            wait;       
        end process;


end Behavioral;
