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

-- Moving average filter
-- ---------------------
-- Useful for cleaning noisy data (low-pass filter) and as an matched-filter for rectangular signals.
-- Args:
-- window_len: Averaging window size, must be power of two. Determines the BRAM usage.
-- For matched-filter, this must equal the samples-per-symbol.
-- dtype: Sfix or Complex (applies to real and imag channels separately)
package MovingAverage_10 is
    type self_t is record
        shr: ShiftRegister_9.self_t;
        acc: complex_t(21 downto -34);
        output: DataValid_3.self_t;
        start_counter: DownCounter_7.self_t;
    end record;
    type MovingAverage_10_self_t_list_t is array (natural range <>) of MovingAverage_10.self_t;

    type self_t_const is record
        WINDOW_LENGTH: integer;
        BIT_GROWTH: integer;
        shr: ShiftRegister_9.self_t_const;
        output: DataValid_3.self_t_const;
        start_counter: DownCounter_7.self_t_const;
    end record;
    type MovingAverage_10_self_t_const_list_t_const is array (natural range <>) of MovingAverage_10.self_t_const;

    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; input: DataValid_3.self_t; ret_0:out DataValid_3.self_t);
    function MovingAverage(shr: ShiftRegister_9.self_t; acc: complex_t(21 downto -34); output: DataValid_3.self_t; start_counter: DownCounter_7.self_t) return self_t;
end package;

package body MovingAverage_10 is
    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; input: DataValid_3.self_t; ret_0:out DataValid_3.self_t) is
    -- Args:
    -- input (DataValid): -1.0 ... 1.0 range, up to 18 bits
    -- Returns:
    -- DataValid: Accumulator scaled and rounded to 18 bits(-1.0 ... 1.0 range). Overflow impossible.
        variable pyha_ret_0: complex_t(1 downto -34);
        variable pyha_ret_1: boolean;
    begin
        if not input.valid then
            ret_0 := DataValid(self.output.data, valid=>False);
            return;

        end if;
        ShiftRegister_9.push_next(self.shr, self_next.shr, self_const.shr, input.data);
        -- add new element to shift register
        ShiftRegister_9.peek(self.shr, self_next.shr, self_const.shr, pyha_ret_0);
        self_next.acc := resize(self.acc + input.data - pyha_ret_0, 10, -17, fixed_wrap, fixed_truncate);
        self_next.output.data := resize(scalb(self.acc, -self_const.BIT_GROWTH), 0, -17, fixed_wrap, fixed_round);
        -- round to standard 18bit format

        -- make sure we don't propagate invalid samples
        DownCounter_7.tick(self.start_counter, self_next.start_counter, self_const.start_counter);
        DownCounter_7.is_over(self.start_counter, self_next.start_counter, self_const.start_counter, pyha_ret_1);
        self_next.output.valid := pyha_ret_1;
        ret_0 := self.output;
        return;
    end procedure;

    function MovingAverage(shr: ShiftRegister_9.self_t; acc: complex_t(21 downto -34); output: DataValid_3.self_t; start_counter: DownCounter_7.self_t) return self_t is
        -- constructor
        variable self: self_t;
    begin
        self.shr := shr;
        self.acc := acc;
        self.output := output;
        self.start_counter := start_counter;
        return self;
    end function;
end package body;
