------------------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_data0      : std_logic_vector (4 - 1 downto 0);
    signal s_data1      : std_logic_vector (4 - 1 downto 0);
    signal s_data2      : std_logic_vector (4 - 1 downto 0);
    signal s_data3      : std_logic_vector (4 - 1 downto 0);
    
    signal s_dp_i       : std_logic_vector (4 - 1 downto 0);
    signal s_dp_o       : std_logic;
    signal s_seg        : std_logic_vector (7 - 1 downto 0);
    signal s_dig        : std_logic_vector (4 - 1 downto 0);

begin
    -- Connecting testbench signals with driver_7seg_4digits entity
    uut_driver_7seg_4digits : entity work.driver_7seg_4digits
    port map(
        clk     => s_clk_100MHZ,
        reset   => s_reset,
        data0_i => s_data0,
        data1_i => s_data1,
        data2_i => s_data2,
        data3_i => s_data3,
        dp_i    => s_dp_i,
        dp_o    => s_dp_o,
        seg_o   => s_seg,
        dig_o   => s_dig
    );
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 128ns;
        s_reset <= '1';
        wait for 53ns;
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;       --3.142
         
        s_data3 <= "0011";
        assert (s_data3(0)=0 and s_data3(1)=0 and s_data3(2)=1 and s_data3(3)=1)
        report "Test failed for number: 3.142" severity error;
        
      
        s_data2 <= "0001";
        assert (s_data2(0)=0 and s_data2(1)=0 and s_data2(2)=0 and s_data2(3)=1)
        report "Test failed for number: 3.142" severity error;
        
        s_data1 <= "0100";
        assert (s_data1(0)=0 and s_data1(1)=1 and s_data1(2)=0 and s_data1(3)=0)
        report "Test failed for number: 3.142" severity error;
        
        s_data0 <= "0010";
        assert (s_data0(0)=0 and s_data0(1)=0 and s_data0(2)=1 and s_data0(3)=0)
        report "Test failed for number: 3.142" severity error;
        
        s_dp_i  <= "0111";
        
        wait for 350 ns;
        
        s_data3 <= "0001";
        s_data2 <= "0000";
        s_data1 <= "0001";
        s_data0 <= "0000";
        
        report "Stimulus process finished" severity note;
        wait;
     end process p_stimulus;
        
        
end architecture testbench;
