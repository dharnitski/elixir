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
end
