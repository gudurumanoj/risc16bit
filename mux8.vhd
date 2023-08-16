library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux8 is
	port(x:in std_logic_vector (7 downto 0);
			sel:in std_logic_vector (2 downto 0);
			y : out std_logic);
end mux8;

architecture mux8arch of mux8 is

begin

	process (x,sel)
		begin
			
			case sel is
			
				when "000"=>
					y<=x(0);
					
				when "001"=>
					y<=x(1);
					
				when "010"=>
					y<=x(2);
					
				when "011"=>
					y<=x(3);
					
				when "100"=>
					y<=x(4);
					
				when "101"=>
					y<=x(5);
					
				when "110"=>
					y<=x(6);
					
				when "111"=>
					y<=x(7);
				when others=> 
					null;
					
		end case;
		
	end process;
	
end architecture;