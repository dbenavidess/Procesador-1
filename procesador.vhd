----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:38 09/26/2017 
-- Design Name: 
-- Module Name:    procesador - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador;


architecture Behavioral of procesador is

component ProgramCounter
	port(
			dataIn : in std_logic_vector(31 downto 0);
			clk : in std_logic;
			rst : in std_logic;
			dataOut : out std_logic_vector(31 downto 0)
	);
end component;
component Sumador32b
	port(
			Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
         Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
         Result : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;
component Instructon_Memory
	port(
			address : in  STD_LOGIC_VECTOR (31 downto 0);
         rst : in  STD_LOGIC;
         instruction : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;



signal add : std_logic_vector(31 downto 0);
signal add_aux : std_logic_vector(31 downto 0);
signal sum : std_logic_vector(31 downto 0);
begin




Inst_NProgramCounter: ProgramCounter PORT MAP(
		rst => rst,
		dataIn => sum,
		clk => clk,
		DataOut => add_aux
	);
Inst_ProgramCounter: ProgramCounter PORT MAP(
		rst => rst,
		dataIn => add_aux,
		clk => clk,
		DataOut => add
	);
Inst_Sumador32b: Sumador32b PORT MAP(
		Oper1 => add,
		Oper2 => "00000000000000000000000000000100",
		Result => sum
	);
Inst_Instructon_Memory: Instructon_Memory PORT MAP(
		address => add,
		rst => rst,
		instruction => instruction
	);

end Behavioral;

