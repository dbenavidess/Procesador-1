----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:29 10/10/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( op_code : in  STD_LOGIC_VECTOR (5 downto 0);
           op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(op_code,op1,op2)
begin

	case op_code is
		--add
		when "000000" => result<= std_logic_vector(SIGNED(op1) + SIGNED(op2));
		--sub
		when "000100" => result<= std_logic_vector(SIGNED(op1) - SIGNED(op2));
		--and
		when "000001" => result<= op1 and op2;
		--andn
		when "000101" => result<= op1 nand op2;
		--or
		when "000010" => result<= op1 or op2;
		--orn
		when "000110" => result<= op1 nor op2;
		--xor
		when "000011" => result<= op1 xor op2;
		--xnor
		when "000111" => result<= op1 xnor op2;
		when others =>   result<= x"11111111";
	end case;
		
end process;


end Behavioral;

