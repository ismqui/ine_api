defmodule IneApiTest do
  use ExUnit.Case
  doctest IneApi

  test "greets the world" do
    assert IneApi.hello() == :world
  end
end
