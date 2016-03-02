# Anonymous functions
add = fn(a, b) ->
    a + b
end

hello = add
first = add.(1, 2)
second = hello.(1, 3)

IO.puts(first)
IO.puts(second)
