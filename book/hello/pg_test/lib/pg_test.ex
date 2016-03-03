defmodule PgTest do

	def register(user) do
		{:ok, pid} = Postgrex.start_link(hostname: "localhost", username: "postgres", password: "postgres", database: "postgres")

		sql = "select * from employee;"
		IO.puts(sql)
    	res = Postgrex.query!(pid, sql, [])
    	[record | last] = res.rows
    	IO.puts(record)

	end
end
