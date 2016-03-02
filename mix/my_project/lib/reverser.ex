defmodule MyProject.Reverse do
    @prefix Application.get_env(:my_project, __MODULE__)[:prefix]
    
    def reverser(thing) do
        @prefix <> String.reverse(thing)
    end
end
