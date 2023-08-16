library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is  
  port(clk,rst,en : in std_logic;
       datain : in std_logic_vector(15 downto 0);  
       dataout : out std_logic_vector(15 downto 0));  
end reg;

architecture regarch of reg is  
  
  begin  
    process (clk,rst,en)  
	 
      begin  
		
			if(rst = '1') then
				dataout <= (others => '0');
				
			elsif ((rising_edge(clk)) and (en = '1')) then  
				dataout <= datain;  
      
		end if;  
    
	 end process;  

end architecture;                      