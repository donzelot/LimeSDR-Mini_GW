-- generated by pyha 0.0.7
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
    use work.DataWithIndex_3.all;
    use work.DataWithIndex_0.all;


package Packager_0 is
    type self_t is record
        \out\: DataWithIndex_0.self_t;
    end record;
    type Packager_0_self_t_list_t is array (natural range <>) of Packager_0.self_t;

    type self_t_const is record
        PACKET_SIZE: integer;
        DELAY: integer;
        \out\: DataWithIndex_0.self_t_const;
    end record;
    type Packager_0_self_t_const_list_t_const is array (natural range <>) of Packager_0.self_t_const;

    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; data: complex_t(1 downto -34); ret_0:out DataWithIndex_0.self_t);
    function Packager(\out\: DataWithIndex_0.self_t) return self_t;
end package;

package body Packager_0 is
    procedure main(self:in self_t; self_next:inout self_t; constant self_const: self_t_const; data: complex_t(1 downto -34); ret_0:out DataWithIndex_0.self_t) is
    -- :type data: Complex
    -- :rtype: DataWithIndex
        variable index: integer;
    begin

        index := (self.\out\.index + 1) mod self_const.PACKET_SIZE;
        if True then
            self_next.\out\.data := resize(data, 0, -17, fixed_wrap, fixed_truncate);
            self_next.\out\.index := index;
            self_next.\out\.valid := True;
        end if;

        ret_0 := self.\out\;
        return;
    end procedure;

    function Packager(\out\: DataWithIndex_0.self_t) return self_t is
        -- limited constructor
        variable self: self_t;
    begin
        self.\out\ := \out\;
        return self;
    end function;
end package body;