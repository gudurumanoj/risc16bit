library IEEE;
use IEEE.std_logic_1164.all;      
use ieee.numeric_std.all;

-- ALU 
-- INPUTS: alu_a, alu_b, op_code
-- OUTPUTS: C-out,Z_out,alu_out

-- Zero flag indicates if after the operation the number becomes 0, zero fkag is set to 1
-- Carry flag if set if carry comes after addition or borrow comes after substraction i.e, in a-b, if b>a, carry flag 
-- 			is set to 1

entity alu is
		port(	inp1 : in std_logic_vector(15 downto 0);
				inp2 : in std_logic_vector(15 downto 0);
				opcode : in std_logic_vector(3 downto 0;
				czin : in std_logic_vector(1 downto 0);
				output : out std_logic_vector(15 downto 0);
				zout : out std_logic;
				cout : out std_logic);
end alu;

architecture aluarch of alu is

signal c: std_logic_vector(16 downto 0);
signal leftshiftedvec : std_logic_vector(15 downto 0);
     
begin

	process (inp1,inp2,opcode,c) is
	
		begin
		
			if (opcode="0001") then
			
				if not(czin = "11") then
					c <= std_logic_vector(resize(unsigned(alu_a),17) + resize(unsigned(alu_b),17));
					cout<=c(16);
					zout<= not( c(0) or c(1) or c(2) or c(3) or c(4) or c(5) or c(6) or c(7) or c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15));
				else
					leftshiftedvec <= inp2(14 downto 0) & '0';
					c <= std_logic_vector(resize(unsigned(leftshiftedvec),17) + resize(unsigned(inp1),17));
					cout<=c(16);
					zout<= not( c(0) or c(1) or c(2) or c(3) or c(4) or c(5) or c(6) or c(7) or c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15));
				end if;
				
		  elsif (opcode = "0000") then
				c <= std_logic_vector(resize(signed(inp2), 17) + resize(unsigned(inp1),17));
				zout<= not( c(0) or c(1) or c(2) or c(3) or c(4) or c(5) or c(6) or c(7) or c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15));
				cout<=c(16);
		  
        end if;
		  
    end process;
	 
	 output <= c(15 downto 0) ;
    
end architecture;
