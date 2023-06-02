----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:39:11 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reg_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_out_7 : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Decoder_3_to_8 port(
    I: in STD_LOGIC_VECTOR;
    EN: in STD_LOGIC;
    Y: out STD_LOGIC_VECTOR );
end component;

component Reg_4Bit Port(
    D : in STD_LOGIC_VECTOR (3 downto 0);
    En : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D_OUT : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => S,
    EN => '1',
    Y => D_OUT );
    
Reg_4Bit_0 : Reg_4Bit
port map(
    D => "0000",
    En => D_OUT(0),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_0 );

Reg_4Bit_1 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(1),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_1 );
   
Reg_4Bit_2 : Reg_4Bit
    port map(
        D => Reg_in,
        En => D_OUT(2),
        Clk => Clk,
        Res => Res,
        Q => Reg_Out_2 );

Reg_4Bit_3 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(3),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_3 );

Reg_4Bit_4 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(4),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_4 );

Reg_4Bit_5 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(5),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_5 );

Reg_4Bit_6 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(6),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_6 );

Reg_4Bit_7 : Reg_4Bit
port map(
    D => Reg_in,
    En => D_OUT(7),
    Clk => Clk,
    Res => Res,
    Q => Reg_Out_7 );

end Behavioral;
