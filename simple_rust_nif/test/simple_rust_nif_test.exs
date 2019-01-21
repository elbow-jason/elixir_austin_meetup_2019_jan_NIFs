defmodule SimpleRustNifTest do
  use ExUnit.Case
  doctest SimpleRustNif

  test "greets the world" do
    assert SimpleRustNif.hello() == :world
  end
end
