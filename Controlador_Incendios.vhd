library ieee;
use ieee.std_logic_1164.all;

entity Controlador_Incendios is
  port (
    clk : in std_logic; -- Reloj
    rst : in std_logic; -- Señal de reinicio
    sensor_humo : in std_logic; -- Señal del sensor de humo
    activar_led : out std_logic;-- Control de la bomba o los aspersores
	 activar_bomba:out std_logic;
	 activar_alarma:out std_logic
	 
  );
end Controlador_Incendios;

architecture Behavioral of Controlador_Incendios is
begin
  process(clk, rst)
  begin
    if rst = '0' or sensor_humo = '1' then
      activar_led <= '1';
      activar_bomba <= '0';
      activar_alarma <= '1';
    else
      activar_led <= '0';
      activar_bomba <= '1';
      activar_alarma <= '0';
    end if;
  end process;
end Behavioral;