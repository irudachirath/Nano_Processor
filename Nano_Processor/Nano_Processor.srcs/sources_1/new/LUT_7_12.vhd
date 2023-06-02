----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 05:58:42 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_7_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_7_12;

architecture Behavioral of LUT_7_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal program_ROM : rom_type := (
        "101110000001", -- 10-(MOVI) 010-(Reg2) 000 1010-(10)
        "101100000010", -- 10-(MOVI) 100-(Reg4) 000 0100-(4)
        "101010000011", -- 00-(ADD) 010-(Reg2) 100-(Reg4) 0000
        "001111100000", -- 3
        "001111010000", -- 4
        "100110000110", -- 5
        "010110000000", -- 6
        "111000000101"  -- 7
    );

begin

data <= program_ROM(to_integer(unsigned(address)));

end Behavioral;
