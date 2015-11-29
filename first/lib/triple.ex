defmodule Triple do
  @moduledoc """
  A more advanced example of multiple generators and filters is Pythagorean triples. A Pythagorean triple is a set of positive integers such that a*a + b*b = c*c

  ## Examples

      iex> Triple.pythagorean(5)
      []

      iex> Triple.pythagorean(12)
      [{3, 4, 5}]

      iex> Triple.pythagorean(48)
      [{3, 4, 5}, {5, 12, 13}, {6, 8, 10}, {8, 15, 17}, {9, 12, 15}, {12, 16, 20}]

      iex> for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>
      "helloworld"

      A common use case of :into can be transforming values in a map, without touching the keys:

      iex> for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val}
      %{"a" => 1, "b" => 4}

  """

  def pythagorean(n) when n > 0 do
    for a <- 1..n-2,
        b <- a+1..n-1,
        c <- b+1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
  end
end
