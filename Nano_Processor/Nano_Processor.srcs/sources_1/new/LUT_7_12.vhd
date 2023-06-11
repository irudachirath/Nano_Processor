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
        "101100000011", -- 10-(MOVI) 110-(Reg6) 000 0011-(3)
        "101010000001", -- 10-(MOVI) 101-(Reg5) 000 0001-(1)
        "011010000000", -- 01-(NEG) 101-(Reg5) 000 0000
        "001111100000", -- 00-(ADD) 111-(Reg7) 110-(Reg6) 0000
        "001101010000", -- 00-(ADD) 111-(Reg6) 101-(Reg5) 0000
        "111100000111", -- 11-(JUMP) 110-(Reg6) 000 0 111(INSTRUCTION 7)
        "110000000011", -- 11-(JUMP) 000-(Reg0='0') 000 0 011(INSTRUCTION 3)
        "110000000111"  -- 11-(JUMP) 000-(Reg0) 000 0 000(INSTRUCTION 7)
        
        --"101110000101", -- 10-(MOVI) 111-(Reg7) 000 1011-(5)
        --"101010001011", -- 10-(MOVI) 101-(Reg5) 000 0101-(11)
        --"001111010000", -- 00-(ADD) 111-(Reg7) 101-(Reg5) 0000
        --"101000001111", -- 10-(MOVI) 101-(Reg4) 000 1111-(15)
        --"001011000000", -- 00-(ADD) 111-(Reg4) 101-(Reg5) 0000
        --"101110000110", -- 10-(MOVI) 111-(Reg7) 000 0110-(6)
        --"101110001001", -- 10-(MOVI) 111-(Reg7) 000 1001-(9)
        --"110000000101"  -- 11-(JUMP) 000-(Reg0) 000 0 000(INSTRUCTION 0)
        
        --"100010000011",
        --"100100000001", 
        --"010100000000", 
        --"000010100000", 
        --"110010000111", 
        --"110000000011",
        --"000011111010", 
        --"110000000111" 
    );

begin

data <= program_ROM(to_integer(unsigned(address)));

end Behavioral;
