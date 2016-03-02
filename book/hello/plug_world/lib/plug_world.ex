defmodule PlugWorld do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts("HERE")
    
    children = [
      # Define workers and child supervisors to be supervised
      worker(__MODULE__, [], function: :run),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
  def run do
    opts = [port: 8080]
    {:ok, _} = Plug.Adapters.Cowboy.http PlugWorld.Router, opts
  end
  
end
