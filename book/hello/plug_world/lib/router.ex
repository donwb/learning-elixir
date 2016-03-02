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
        IO.puts inspect conn
        send_resp(conn, 200, "This thing runs on Elixir Plugs!")
    end
    
    # A default router to handle unhandleable shit
    match _ do  
      conn
      |> send_resp(404, "Nothing here")
      |> halt
    end

    def start do
        Plug.Adapters.Cowboy.http Rest, [], port: 8080
    end
end
