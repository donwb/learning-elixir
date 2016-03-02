defmodule Test do
    def zero?(0) do
        true
    end
    
    def zero?(n) when is_number(n) do
        false
    end
end

thisIsTrue = Test.zero?(0)
thisIsnt = Test.zero?(10)

# this prevents compilation b/c the guard acts as a static type
# noway = Test.zero?("haha")

IO.puts(thisIsTrue)
IO.puts(thisIsnt)

