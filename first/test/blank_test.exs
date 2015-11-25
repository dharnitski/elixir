# from http://elixir-lang.org/getting-started/protocols.html
defmodule TestBlank do
  use ExUnit.Case
  doctest Blank

  test "Blank integer" do
    assert Blank.blank?(0) == false
  end

  test "Blank Empty Array" do
    assert Blank.blank?([])
  end

  test "Blank not Empty Array" do
    assert Blank.blank?([1, 2, 3]) == false
  end

  test "Blank not implemented type" do
    assert_raise Protocol.UndefinedError, fn ->
      Blank.blank?("hello")
    end
  end
end
