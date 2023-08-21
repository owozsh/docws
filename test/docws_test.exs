defmodule DocwsTest do
  use ExUnit.Case
  doctest Docws

  test "greets the world" do
    assert Docws.hello() == :world
  end
end
