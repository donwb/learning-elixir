
name = "don"

cond do
    1 + 1 == 1 ->
        IO.puts("this never runs")
    2 * 2 != 4 ->
        IO.puts("nor does this")
    true ->
        IO.puts("this does run though")
end

case name do
    "don" -> IO.puts("yep, that's my name")
    other -> IO.puts("nope")
end


if 1 + 1 == 3 do
    IO.puts("This won't happen")
else
    IO.puts("But this will")
end


unless 1 + 1 == 3 do
    IO.puts("Love the unless statement")
end
