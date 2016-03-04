defmodule PgTestTest do
  use ExUnit.Case
  doctest PgTest

  test "is able to access database" do
    len = PgTest.select_all()
    
    assert len == 4
  end

  test "is able to find Wilma" do
  	ret = PgTest.select_one("Wilma Flinstone")
  	
  	# Do you really need to ignore the rest of the tuples?
  	[name, _, _] = ret
  	
  	assert String.strip(name) == "Wilma Flinstone"
  end
end
