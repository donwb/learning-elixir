defmodule PlugWorld.Db do
    
    def select_all() do
		{:ok, pid} = connect

		sql = "select * from employee;"
    	res = Postgrex.query!(pid, sql, [])
	end

	defp connect() do
		{:ok, pid} = Postgrex.start_link(hostname: "localhost", username: "postgres", password: "postgres", database: "postgres")
	end
	
end