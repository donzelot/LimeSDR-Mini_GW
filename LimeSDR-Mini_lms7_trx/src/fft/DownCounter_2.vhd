-- generated by pyha 0.0.10
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.fixed_float_types.all;
    use ieee.fixed_pkg.all;
    use ieee.math_real.all;

library work;
    use work.complex_pkg.all;
    use work.PyhaUtil.all;
    use work.Typedefs.all;
    use work.all;
    use work.DataValid_27.all;
    use work.DataValid_26.all;
    use work.DataValid_25.all;
    use work.DataValid_0.all;
    use work.DataValid_23.all;
    use work.DataValid_24.all;
    use work.ShiftRegister_5.all;
    use work.DownCounter_0.all;
    use work.MovingAverage_2.all;
    use work.ShiftRegister_0.all;
    use work.MovingAverage_0.all;
    use work.ShiftRegister_7.all;
    use work.DCRemoval_1.all;
    use work.Windower_0.all;
    use work.ShiftRegister_20.all;
    use work.DownCounter_18.all;
    use work.StageR2SDF_13.all;
    use work.ShiftRegister_3.all;


package DownCounter_2 is
    type self_t is record
        counter: sfixed(13 downto 0);
    end record;
    type DownCounter_2_self_t_list_t is array (natural range <>) of DownCounter_2.self_t;

    type self_t_const is record
        START_VALUE: sfixed(13 downto 0);
    end record;
    type DownCounter_2_self_t_const_list_t_const is array (natural range <>) of DownCounter_2.self_t_const;

    procedure is_over(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; ret_0:out boolean);
    procedure tick(self:in self_t; self_next:inout self_t; constant self_const: self_t_const);
    function DownCounter(counter: sfixed(13 downto 0)) return self_t;
end package;

package body DownCounter_2 is
    procedure is_over(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; ret_0:out boolean) is


    begin
        -- test if counter is negative -> must be over
        ret_0 := sign_bit(self.counter - 1);
        return;
    end procedure;

    procedure tick(self:in self_t; self_next:inout self_t; constant self_const: self_t_const) is

        variable pyha_ret_0: boolean;
    begin
        is_over(self, self_next, self_const, pyha_ret_0);
        if not pyha_ret_0 then
            self_next.counter := resize(self.counter - 1, 13, 0, fixed_wrap, fixed_truncate);
        end if;
    end procedure;

    function DownCounter(counter: sfixed(13 downto 0)) return self_t is
        -- constructor
        variable self: self_t;
    begin
        self.counter := counter;
        return self;
    end function;
end package body;
