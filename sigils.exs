words = ~w(hello there)
IO.puts(words)

Enum.all?(words, fn(x) -> IO.puts(x) end)

# s sigil allows quoted strings
quoted = ~s("hello")
IO.puts(quoted)


# Custom sigil

defmodule MySigils do
    def sigil_u(content, _opts) do
        content
        |> String.split
        |> Enum.map(&String.upcase/1)
    end
end

defmodule DoStuff do
    import MySigils
    
    def some_function() do
        ret = ~u(some function)
        IO.puts(ret)
    end
end
DoStuff.some_function()

