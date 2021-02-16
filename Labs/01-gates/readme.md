
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 |  |
| 0 | 0 | 1 |  |
| 0 | 1 | 0 |  |
| 0 | 1 | 1 |  |
| 1 | 0 | 0 |  |
| 1 | 0 | 1 |  |
| 1 | 1 | 0 |  |
| 1 | 1 | 1 |  |

```vhdl
------------------------------------------------------------------------
--
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i	   : in  std_logic;         -- Data input
        f_o    : out std_logic;         -- OR output function
        fnand_o: out std_logic;         -- AND output function
        fnor_o : out std_logic        -- XOR output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or  ((not c_i) and (not b_i));
    fnand_o <= not(not((not b_i) and a_i) and not((not c_i) and (not b_i)));
    fnor_o  <= not(b_i or (not a_i)) or not(c_i or b_i);




end architecture dataflow;
```


![Gates](Digital-electronics-1/Labs/01-gates/gates.PNG)

https://www.edaplayground.com/x/EPr9

```vhdl
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
entity distributive is
    port(
        x_i    : in  std_logic;         -- Data input
        y_i    : in  std_logic;         -- Data input
        z_i	   : in  std_logic;         -- Data input
        al_o   : out std_logic;         -- 1st left side of eq
        ar_o   : out std_logic;         -- 1st right side of eq
        bl_o   : out std_logic;         -- 2st left side of eq
        br_o   : out std_logic          -- 2st right side of eq
    );
end entity distributive;

------------------------------------------------------------------------

architecture dataflow of distributive is
begin
  al_o <= (x_i and y_i) or (x_i and z_i);
  ar_o <= x_i and (y_i or z_i);
  bl_o <= (x_i or y_i) and (x_i or z_i);
  br_o <= x_i or ( y_i and z_i );



end architecture dataflow;
```


![Distributive](Digital-electronics-1/Labs/01-gates/distributive.PNG)

https://www.edaplayground.com/x/mHgZ

