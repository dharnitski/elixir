# from http://elixir-lang.org/getting-started/modules.html
defmodule TestMath do
  use ExUnit.Case
  doctest Math

  test "sum 1 and 2 should be 3" do
    assert Math.sum(1, 2) == 3
  end

  #IO.puts Math.zero?(0)       #=> true
  test "zero for 0 should be true" do
    assert Math.zero?(0)
  end

  #IO.puts Math.zero?(1)       #=> false
  test "zero for 1 should be false" do
    assert !Math.zero?(1)
  end

  #IO.puts Math.zero?([1,2,3]) #=> ** (FunctionClauseError)
  test "bad argument in arithmetic expression" do
    assert_raise FunctionClauseError, fn ->
      Math.zero?([1,2,3])
    end
  end

  test "capture functon from module" do
    fun = &Math.zero?/1
    assert is_function fun
  end

  test "build function using capture syntax" do
    #similar to fn x -> x + 1 end
    fun = &(&1 + 1)
    #Function<6.71889879/1 in :erl_eval.expr/5>
    assert fun.(1) == 2
  end

  test "sum elements in the list using recursion" do
    assert Math.sum_list([1, 2, 3], 0) == 6
    assert Enum.reduce([1, 2, 3], 0, fn(x, acc) -> x + acc end) == 6
    assert Enum.reduce([1, 2, 3], 0, &+/2) == 6
  end

  test "double elements in the list using recursion" do
    assert Math.double_each([1, 2, 3]) == [2, 4, 6]
    assert Enum.map([1, 2, 3], fn(x) -> x * 2 end) == [2, 4, 6]
    assert Enum.map([1, 2, 3], &(&1 * 2)) == [2, 4, 6]
  end

end
