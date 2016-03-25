defmodule PgTest do
	import Ecto.Query
	
	def select_all() do
		{:ok, pid} = connect

		sql = "select * from employee;"
    	res = Postgrex.query!(pid, sql, [])

    	Enum.each(res.rows, fn(r)
    		-> 
    			[name, dept, job, id] = r

    			# not thinking this is idomatic
    			n = String.strip(name)
    			d = String.strip(dept)
    			j = String.strip(job)

    			IO.puts(n <> " is a " <> j <> " in the " <> d <> " department")
    			
    	end)

    	length res.rows
	end

	def select_one(person) do
		
		{:ok, pid} = connect

		sql = "select * from employee where Name = $1;"
    	res = Postgrex.query!(pid, sql, [person])
    	[record | _] = res.rows
    	
    	# had to do this to prevet the above from returning a
    	# list of tuples rather than the tuples themselves???
    	record
	end

	defp connect() do
		{:ok, pid} = Postgrex.start_link(hostname: "localhost", username: "postgres", password: "postgres", database: "postgres")
	end
	
	
	def test_query do
	
		query = from e in Employee,
			where: e.id > 7,
			select: e
			
		res = PgTest.Repo.all(query)
		
	end
	
end
