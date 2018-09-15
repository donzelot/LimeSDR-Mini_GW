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
    use work.DownCounter_2.all;
    use work.StageR2SDF_0.all;
    use work.ShiftRegister_4.all;
    use work.DownCounter_3.all;
    use work.StageR2SDF_2.all;
    use work.DownCounter_8.all;
    use work.StageR2SDF_3.all;
    use work.ShiftRegister_11.all;
    use work.DownCounter_9.all;
    use work.StageR2SDF_4.all;
    use work.ShiftRegister_12.all;
    use work.DownCounter_10.all;
    use work.StageR2SDF_5.all;
    use work.ShiftRegister_13.all;
    use work.DownCounter_11.all;
    use work.StageR2SDF_6.all;
    use work.ShiftRegister_14.all;
    use work.DownCounter_12.all;
    use work.StageR2SDF_7.all;
    use work.ShiftRegister_15.all;
    use work.DownCounter_13.all;
    use work.StageR2SDF_8.all;
    use work.ShiftRegister_16.all;
    use work.DownCounter_14.all;
    use work.StageR2SDF_9.all;
    use work.ShiftRegister_17.all;
    use work.DownCounter_15.all;
    use work.StageR2SDF_10.all;
    use work.ShiftRegister_18.all;
    use work.DownCounter_16.all;
    use work.StageR2SDF_11.all;
    use work.ShiftRegister_19.all;
    use work.StageR2SDF_12.all;
    use work.R2SDF_0.all;

-- Turns FFT result into power ~equalish to : abs(fft_result)
-- Note that this core consumes Complex samples but outputs Sfix samples.
-- TODO: Should output unsigned
-- TODO: rename to MultConjugate?
package FFTPower_0 is
    type self_t is record
        \out\: DataValid_24.self_t;
    end record;
    type FFTPower_0_self_t_list_t is array (natural range <>) of FFTPower_0.self_t;

    type self_t_const is record
        \out\: DataValid_24.self_t_const;
    end record;
    type FFTPower_0_self_t_const_list_t_const is array (natural range <>) of FFTPower_0.self_t_const;

    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; inp: DataValid_23.self_t; ret_0:out DataValid_24.self_t);
    function FFTPower(\out\: DataValid_24.self_t) return self_t;
end package;

package body FFTPower_0 is
    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; inp: DataValid_23.self_t; ret_0:out DataValid_24.self_t) is


    begin
        if not inp.valid then
            ret_0 := DataValid(self.\out\.data, valid=>False);
            return;

            -- (a + bi)(a - bi) = a**2 + b**2
        end if;
        self_next.\out\.data := resize((get_real(inp.data) * get_real(inp.data)) + (get_imag(inp.data) * get_imag(inp.data)), -5, -40, fixed_wrap, fixed_truncate);
        self_next.\out\.valid := inp.valid;
        ret_0 := self.\out\;
        return;
    end procedure;

    function FFTPower(\out\: DataValid_24.self_t) return self_t is
        -- constructor
        variable self: self_t;
    begin
        self.\out\ := \out\;
        return self;
    end function;
end package body;