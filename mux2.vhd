library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity mux2 is
	port(x0,x1:in std_logic_vector(15 downto 0);
			sel:in std_logic;
			y : out std_logic_vector(15 downto 0));
end mux2;
 
architecture mux2arch of mux2 is

begin

	process (x0,x1,sel)
	begin
		
		case sel is
			when '0'=>
				y<=x0;
			
			when '1'=>
				y<=x1;
		
			when others=> null;
		
		end case;
	
	end process;

end architecture;