----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:05:47 AM
-- Design Name: 
-- Module Name: CPU - Behavioral
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

entity CPU is
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg_7_LED : out STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end CPU;

architecture Behavioral of CPU is

component Adder_3_Bit port (
    A : in STD_LOGIC_VECTOR (2 downto 0);
    S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Reg_Bank port (
    S : in STD_LOGIC_VECTOR (2 downto 0);
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
end component;

component Mux_8_1_4Bit Port ( 
       S : in STD_LOGIC_VECTOR (2 downto 0);
       D0 : in STD_LOGIC_VECTOR (3 downto 0);
       D1 : in STD_LOGIC_VECTOR (3 downto 0);
       D2 : in STD_LOGIC_VECTOR (3 downto 0);
       D3 : in STD_LOGIC_VECTOR (3 downto 0);
       D4 : in STD_LOGIC_VECTOR (3 downto 0);
       D5 : in STD_LOGIC_VECTOR (3 downto 0);
       D6 : in STD_LOGIC_VECTOR (3 downto 0);
       D7 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4 port ( 
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_out : out STD_LOGIC;
       Zero: out std_logic);
end component;

component Instruction_Decoder port ( 
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

component LUT_16_7 port ( 
       address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component LUT_7_12 port ( 
       address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUX_2_1_3Bit port ( 
       A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       S : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_1_4Bit port ( 
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Program_Counter_3Bit port ( 
       D : in STD_LOGIC_VECTOR (2 downto 0);
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk port (
       Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

signal Clk_out, Load_Sel, Add_Sub_Sel, Jump_Flag : std_logic;
signal D0, D1, D2, D3, D4, D5, D6, D7, Mux_0_out, Mux_1_out, Sum, Im_Val, Reg_bank_in : std_logic_vector(3 downto 0);
signal RA_Sel, RB_Sel, Jump_Ad, Inc_out, Curr_Ad, Q : std_logic_vector(2 downto 0);
signal I : std_logic_vector(11 downto 0);

begin

Slow_Clock_0 : Slow_Clk port map(
    Clk_in => Clk_in,
    Clk_out => Clk_out);

Reg_Bank_0 : Reg_Bank port map(
    S => RA_Sel,
    Reg_in => Reg_bank_in,
    Res => Res,
    Clk => Clk_out,
    Reg_out_0 => D0,
    Reg_out_1 => D1,
    Reg_out_2 => D2,
    Reg_out_3 => D3,
    Reg_out_4 => D4,
    Reg_out_5 => D5,
    Reg_out_6 => D6,
    Reg_out_7 => D7);

Mux_8_1_4Bit_0 : Mux_8_1_4Bit port map(
    S => RA_Sel,
    D0 => D0,
    D1 => D1,
    D2 => D2,
    D3 => D3,
    D4 => D4,
    D5 => D5,
    D6 => D6,
    D7 => D7,
    EN => '1',
    Y => Mux_0_out);
    
Mux_8_1_4Bit_1 : Mux_8_1_4Bit port map(
    S => RB_Sel,
    D0 => D0,
    D1 => D1,
    D2 => D2,
    D3 => D3,
    D4 => D4,
    D5 => D5,
    D6 => D6,
    D7 => D7,
    EN => '1',
    Y => Mux_1_out);
    
RCA_4_0 : RCA_4 port map(
    A => Mux_1_out, --RB
    B => Mux_0_out, --RA
    C_in => Add_Sub_Sel,
    S => Sum,
    C_out => Overflow,
    Zero => Zero);

Instruction_Decoder_0 : Instruction_Decoder port map(
    IB => I,
    R_Val => Mux_0_out,
    RA_Sel => RA_Sel,
    RB_Sel => RB_Sel,
    Load_Sel => Load_Sel,
    Im_Val => Im_Val,
    Add_Sub_Sel => Add_Sub_Sel,
    Jump_Flag => Jump_Flag,
    Jump_Ad => Jump_Ad);

Mux_2_1_4Bit_0 : Mux_2_1_4Bit port map(
    A => Sum,
    B => Im_Val,
    S => Load_Sel,
    Y => Reg_bank_in);
    
Adder_3_Bit_0 : Adder_3_Bit port map(
    A => Q,
    S => Inc_out);
    
Mux_2_1_3Bit_0 : Mux_2_1_3Bit port map(
        A => Inc_out,
        B => Jump_Ad,
        S => Jump_Flag,
        Y => Curr_Ad);

Program_Counter_3Bit_0 : Program_Counter_3Bit port map(
    D => Curr_Ad,
    Res => Res,
    Clk => Clk_out,
    Q => Q);
    
Program_ROM_0 : LUT_7_12 port map(
    address => Q,
    data => I);
    
Seven_segment_0 : LUT_16_7 port map(
    address => D7,
    data => Reg_7_7Seg);
    
Reg_7_LED <= D7;
Anode_out <= "1110";
    
end Behavioral;
