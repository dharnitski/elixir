# from http://elixir-lang.org/getting-started/modules.html
defmodule TestConcat do
  use ExUnit.Case
  doctest Concat

  test "Concat strings with default argument" do
    assert Concat.join("Hello", "world") == "Hello world"
  end

  test "Concat strings with all arguments" do
    assert Concat.join("Hello", "world", "_") == "Hello_world"
  end

end
