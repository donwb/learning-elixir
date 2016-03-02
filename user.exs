defmodule User do
    @moduledoc """
    Defines the user struct and a few user operations
    """
    import String, only: [split: 1]
    import List, only: [first: 1, last: 1]
    
    defstruct name: nil, email: nil

    @doc """
    Gets the first name of the user
    
    ## Parameters
    - `user` - A User struct
    
    ## Examples
    user = %User{name: "Don Browning"}
    User.first_name(user)
    """
    def first_name(user) do
        user.name
        |> split
        |> first
    end
    
    def last_name(user) do
        # alternative using private function
        user
        |> get_names
        |> last
    end
    
    defp get_names(user) do
        split(user.name)
    end
end
