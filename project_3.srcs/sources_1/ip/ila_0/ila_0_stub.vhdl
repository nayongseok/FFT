-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Apr 22 15:14:34 2020
-- Host        : DESKTOP-PB838JL running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/Public/project_3/project_3.srcs/sources_1/ip/ila_0/ila_0_stub.vhdl
-- Design      : ila_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe23 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe29 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe37 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe38 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe39 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe40 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    probe41 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe42 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe46 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe49 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe50 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe51 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe52 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe53 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe54 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe55 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe56 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    probe57 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe58 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe59 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe60 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe61 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end ila_0;

architecture stub of ila_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[31:0],probe1[31:0],probe2[0:0],probe3[31:0],probe4[8:0],probe5[12:0],probe6[12:0],probe7[13:0],probe8[13:0],probe9[14:0],probe10[14:0],probe11[15:0],probe12[15:0],probe13[16:0],probe14[16:0],probe15[17:0],probe16[17:0],probe17[18:0],probe18[18:0],probe19[19:0],probe20[19:0],probe21[0:0],probe22[0:0],probe23[1:0],probe24[2:0],probe25[3:0],probe26[4:0],probe27[5:0],probe28[0:0],probe29[12:0],probe30[12:0],probe31[12:0],probe32[12:0],probe33[13:0],probe34[13:0],probe35[13:0],probe36[13:0],probe37[14:0],probe38[14:0],probe39[14:0],probe40[14:0],probe41[15:0],probe42[15:0],probe43[15:0],probe44[15:0],probe45[16:0],probe46[16:0],probe47[16:0],probe48[16:0],probe49[17:0],probe50[17:0],probe51[17:0],probe52[17:0],probe53[18:0],probe54[18:0],probe55[18:0],probe56[18:0],probe57[31:0],probe58[31:0],probe59[0:0],probe60[0:0],probe61[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2018.2";
begin
end;
