
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
  Port (buton : in std_logic;
        sevenseg : out std_logic_vector(7 downto 0);
        AN : out std_logic_vector(7 downto 0);
        clock : in std_logic);
        
end top;

architecture Behavioral of top is
signal b : integer := 0 ;

begin

process(buton) 
variable cnt : integer:=0;
begin
AN <= "11111110";
if (buton ='1') then
 if (rising_edge(clock)) then
       b <= b + 1;
         if(b = 9000000)then 
            b <= 0;
    cnt := cnt +1 ;
    end if;
    if( cnt >=9) then
        cnt :=0;
        end if;
    end if;
end if; 
case cnt is 
when 0 => sevenseg <= "01000000"; --0
when 1 => sevenseg <= "01111001"; --1
when 2 => sevenseg <= "00100100"; --2
when 3 => sevenseg <= "00110000"; --3
when 4 => sevenseg <= "00011001"; --4
when 5 => sevenseg <= "00010010"; --5
when 6 => sevenseg <= "00000010"; --6
when 7 => sevenseg <= "01111000"; --7
when 8 => sevenseg <= "00000000"; --8
when 9 => sevenseg <= "00010000"; --9
when others => report "unreachable" severity failure;

end case;
end process;
end Behavioral;