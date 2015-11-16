# from http://elixir-lang.org/getting-started/modules.html
defmodule TestEnum do
  use ExUnit.Case

  test "map map" do
    assert Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end) == [2, 12]
  end

  test "map range" do
    assert Enum.map(1..3, fn x -> x * 2 end) == [2, 4, 6]
  end

  test "reduce range" do
    assert Enum.reduce(1..3, 0, &+/2) == 6
  end

end
