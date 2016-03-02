defmodule PlugWorld.Router do
    use Plug.Router
    import Plug.Conn
    
    if Mix.env == :dev do
        IO.puts("debug")
        use Plug.Debugger
    end
    
    plug :match
    plug :dispatch
    
    get "/" do
        IO.puts(System.get_env("PORT"))
        send_resp(conn, 200, "This thing runs on Elixir Plugs!")
    end
    
    def start do
        Plug.Adapters.Cowboy.http Rest, [], port: 8080
    end
end
