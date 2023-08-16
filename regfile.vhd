library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity regfile is   
    port(rfa1 : in  std_logic_vector(2 downto 0);
			rfa2 : in  std_logic_vector(2 downto 0);
			rfa3 : in  std_logic_vector(2 downto 0);
			rfd1 : out std_logic_vector(15 downto 0);
			rfd2 : out std_logic_vector(15 downto 0);
			rfd3 : in  std_logic_vector(15 downto 0);
			wren : in  std_logic;
			clk,rst : in  std_logic);
end regfile;

architecture regfilearch of regfile is
	type R is array(0 to 7) of std_logic_vector(15 downto 0); --Eight 16-bit registers r(0) to r(7)
	signal registers : R := (others => (others => '0') ) ;

begin

    Reg_file: process(clk,rst,wren)
    begin
			
			if (rst = '1') then
				registers <= (others => (others => '0'));
				
			elsif rising_edge(clk) and (wren = '1') then
				registers(to_integer(unsigned(rfa3))) <= rfd3;
				
			end if ;

    end process;
	 
	rfd1 <= registers(to_integer(unsigned(rfa1))); 
	rfd2 <= registers(to_integer(unsigned(rfa2)));
	
end architecture;