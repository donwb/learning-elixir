# What's interesting is variable assignment is not 
# regular assignment, it's based on "pattern matching" as
# you see below

basicVar = "some value"
# this is really a pattern match that winds up being
# a variable assignment.  Check out the tuples for more info though

# tuples
{name, age} = {"Don", 43}
IO.puts("Name: #{name}")
IO.puts("Age: #{age}")

# skip a tuple value w/an '_'
{name, _} = {"Traci", 44}
IO.puts("New name: #{name}")
IO.puts("Age is the same: #{age}")

#use the match operator to make assertions
{"Daniel", age} = {"Daniel", 24}
# this throws an error b/c "Daniel" is missing
# ** (MatchError) no match of right hand side value: {"Ash", 30}
# {"Daniel", age} = {"Ash", 30}

# This is useful to quickly fail assertions like
#{:ok, contents} = File.read("file.txt")
# This will fail b/c the first return value is :error if file doesn't exist



