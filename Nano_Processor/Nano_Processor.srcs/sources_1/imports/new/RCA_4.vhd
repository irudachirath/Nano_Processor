----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2023 02:55:01 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero: out std_logic);
end RCA_4;

architecture Behavioral of RCA_4 is
component FA
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C, Carry : std_logic;
SIGNAL bVal, sVal : std_logic_vector(3 downto 0); 

begin

bVal(0) <= B(0) XOR C_in;

FA_0 : FA port map (
     A => A(0),
     B => bVal(0),
     C_in => C_in, 
     S => sVal(0),
     C_Out => FA0_C
);

bVal(1) <= B(1) XOR C_in;

FA_1 : FA port map (
     A => A(1),
     B => bVal(1),
     C_in => FA0_C,
     S => sVal(1),
     C_Out => FA1_C
);

bVal(2) <= B(2) XOR C_in;

FA_2 : FA port map (
     A => A(2),
     B => bVal(2),
     C_in => FA1_C,
     S => sVal(2),
     C_Out => FA2_C
);

bVal(3) <= B(3) XOR C_in;

FA_3 : FA port map (
     A => A(3),
     B => bVal(3),
     C_in => FA2_C,
     S => sVal(3),
     C_Out => FA3_C
);

Carry <= FA3_C XOR C_in;
Zero <= NOT(sVal(0) OR sVal(1) OR sVal(2) OR sVal(3) OR Carry);
S <= sVal;
C_out <= Carry;

end Behavioral;
