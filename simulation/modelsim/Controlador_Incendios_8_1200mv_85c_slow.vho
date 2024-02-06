-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/09/2023 09:11:37"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Controlador_Incendios IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	sensor_humo : IN std_logic;
	activar_led : BUFFER std_logic;
	activar_bomba : BUFFER std_logic;
	activar_alarma : BUFFER std_logic
	);
END Controlador_Incendios;

-- Design Ports Information
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_led	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_bomba	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- activar_alarma	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sensor_humo	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Controlador_Incendios IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_sensor_humo : std_logic;
SIGNAL ww_activar_led : std_logic;
SIGNAL ww_activar_bomba : std_logic;
SIGNAL ww_activar_alarma : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \activar_led~output_o\ : std_logic;
SIGNAL \activar_bomba~output_o\ : std_logic;
SIGNAL \activar_alarma~output_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \sensor_humo~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_sensor_humo <= sensor_humo;
activar_led <= ww_activar_led;
activar_bomba <= ww_activar_bomba;
activar_alarma <= ww_activar_alarma;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;

-- Location: IOOBUF_X34_Y9_N16
\activar_led~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \process_0~0_combout\,
	devoe => ww_devoe,
	o => \activar_led~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\activar_bomba~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_process_0~0_combout\,
	devoe => ww_devoe,
	o => \activar_bomba~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\activar_alarma~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \process_0~0_combout\,
	devoe => ww_devoe,
	o => \activar_alarma~output_o\);

-- Location: IOIBUF_X0_Y11_N22
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\sensor_humo~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sensor_humo,
	o => \sensor_humo~input_o\);

-- Location: LCCOMB_X28_Y17_N24
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\sensor_humo~input_o\) # (!\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datad => \sensor_humo~input_o\,
	combout => \process_0~0_combout\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

ww_activar_led <= \activar_led~output_o\;

ww_activar_bomba <= \activar_bomba~output_o\;

ww_activar_alarma <= \activar_alarma~output_o\;
END structure;


