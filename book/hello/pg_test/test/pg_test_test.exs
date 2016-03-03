defmodule PgTestTest do
  use ExUnit.Case
  doctest PgTest

  test "is able to access database" do
    PgTest.register({"test@test.com", "password"})
    #assert res.success,res.message
  end
end
