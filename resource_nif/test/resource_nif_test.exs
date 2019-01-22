defmodule ResourceNifTest do
  use ExUnit.Case
  doctest ResourceNif

  test "greets the world" do
    assert ResourceNif.hello() == :world
  end
end
