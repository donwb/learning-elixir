
[1, 2, 3]
|> Stream.each(fn(n) -> IO.puts(n) end)
|> Stream.run

# vs emum

list = [1, 2, 3]

# iterates 2 times
list
|> Enum.filter(&is_number/1)
|> Enum.filter(&(&1 * 2 == 4))

# iterates once
list
|> Stream.filter(&is_number/1)
|> Stream.filter(&(&1 * 2 == 4))
|> Enum.into([])
