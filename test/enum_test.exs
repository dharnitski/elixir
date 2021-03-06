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

  test "filter" do
    odd? = &(rem(&1, 2) != 0)
    #Function<6.80484245/1 in :erl_eval.expr/5>
    assert Enum.filter(1..3, odd?) == [1, 3]
  end

  test "functions without pipeline" do
    odd? = &(rem(&1, 2) != 0)
    assert Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 * 3)), odd?)) == 7500000000
  end

  test "pipelines are eager" do
    odd? = &(rem(&1, 2) != 0)
    assert 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum == 7500000000
  end

  test "streams are lazy, computations are invoked only when we pass it to the Enum module" do
    odd? = &(rem(&1, 2) != 0)
    assert 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum == 7500000000
  end

  test "Stream.cycle/1 cycles a given enumerable infinitely" do
    stream = Stream.cycle([1, 2, 3])
    assert Enum.take(stream, 10) == [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
  end

end
