defmodule PlugWorld.Router do
    use Plug.Router
    use Plug.Builder
    
    
    if Mix.env == :dev do
        IO.puts("debug")
        use Plug.Debugger
    end
    
    plug Plug.Static, at: "/public", from: :plug_world
    
    plug :match
    plug :dispatch
    
    get "/" do
        IO.puts inspect conn
        send_resp(conn, 200, "This thing runs on Elixir Plugs!")
    end
    
    get "/p" do
        send_file(conn, 200, "priv/static/index.html")
    end

    # The guard will ensure the correct route is run
    get "/about/:name" when name == "history" do
        send_resp(conn, 200, "Our website history")
    end
    
    get "/about/:name" do
        send_resp(conn, 200, "#{name} was the URL Param")
    end

    # wildcard routes
    # this could allow us to do /controller/action
    get "/about/*glob" do
        [thing, place] = glob
        send_resp(conn, 200, "We have a #{thing} over in the #{place}")
    end

    # a little json action
    get "/json/:name" do
        res = PlugWorld.Db.select_all()
        
    	folks = Enum.map(res.rows, fn(x)
    	->
    	    [name, job, desc] = x
    	    %{name: String.strip(name), 
    	      job: String.strip(job),
    	      desc: String.strip(desc)}
    	end)
    	
        conn
        |>put_resp_content_type("application/json")
        |>send_resp(200, Poison.encode!(folks))
    end

    # move actions to their own file and just handle the route here
    get "/page/:action" do
        [controller, action] = ["page", action]
        PlugWorld.Page.render(conn, controller, action)
    end

    # Plug also supports PUT, POST, PATCH, DELETE

    # A default router to handle unhandleable shit
    match _ do  
      conn
      |> send_resp(404, "Nothing here")
      |> halt
    end

end
