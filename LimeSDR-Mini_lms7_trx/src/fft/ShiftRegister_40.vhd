-- generated by pyha 0.0.11
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
    use work.DataValid_0.all;
    use work.DataValid_1.all;
    use work.DataValid_2.all;
    use work.DataValid_3.all;
    use work.DataValid_4.all;
    use work.DataValid_5.all;
    use work.ShiftRegister_6.all;
    use work.DownCounter_7.all;
    use work.MovingAverage_8.all;
    use work.ShiftRegister_9.all;
    use work.MovingAverage_10.all;
    use work.ShiftRegister_11.all;
    use work.DCRemoval_12.all;
    use work.Windower_13.all;
    use work.ShiftRegister_14.all;
    use work.DownCounter_15.all;
    use work.StageR2SDF_16.all;
    use work.ShiftRegister_17.all;
    use work.DownCounter_18.all;
    use work.StageR2SDF_19.all;
    use work.ShiftRegister_20.all;
    use work.DownCounter_21.all;
    use work.StageR2SDF_22.all;
    use work.DownCounter_23.all;
    use work.StageR2SDF_24.all;
    use work.ShiftRegister_25.all;
    use work.DownCounter_26.all;
    use work.StageR2SDF_27.all;
    use work.ShiftRegister_28.all;
    use work.DownCounter_29.all;
    use work.StageR2SDF_30.all;
    use work.ShiftRegister_31.all;
    use work.DownCounter_32.all;
    use work.StageR2SDF_33.all;
    use work.ShiftRegister_34.all;
    use work.DownCounter_35.all;
    use work.StageR2SDF_36.all;
    use work.ShiftRegister_37.all;
    use work.DownCounter_38.all;
    use work.StageR2SDF_39.all;


package ShiftRegister_40 is
    type self_t is record
        data: Typedefs.complex_t1downto_34_list_t(0 to 15);
        to_push: complex_t(1 downto -34);
    end record;
    type ShiftRegister_40_self_t_list_t is array (natural range <>) of ShiftRegister_40.self_t;

    type self_t_const is record
        DUMMY: integer;
    end record;
    type ShiftRegister_40_self_t_const_list_t_const is array (natural range <>) of ShiftRegister_40.self_t_const;

    procedure peek(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; ret_0:out complex_t(1 downto -34));
    procedure push_next(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; item: complex_t(1 downto -34));
    function ShiftRegister(data: Typedefs.complex_t1downto_34_list_t(0 to 15); to_push: complex_t(1 downto -34)) return self_t;
end package;

package body ShiftRegister_40 is
    procedure peek(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; ret_0:out complex_t(1 downto -34)) is


    begin
        ret_0 := self.data(0);
        return;
    end procedure;

    procedure push_next(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; item: complex_t(1 downto -34)) is
    -- Actual push happens on the next clock cycle!

    begin
        -- CONVERSION PREPROCESSOR replace next line with:
        -- self.data = self.data[1:] + [item]
        self_next.data := self.data(1 to self.data'high) & item;
    end procedure;

    function ShiftRegister(data: Typedefs.complex_t1downto_34_list_t(0 to 15); to_push: complex_t(1 downto -34)) return self_t is
        -- constructor
        variable self: self_t;
    begin
        self.data := data;
        self.to_push := to_push;
        return self;
    end function;
end package body;