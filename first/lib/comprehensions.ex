defmodule Comprehensions do
  @moduledoc """
    http://elixir-lang.org/getting-started/comprehensions.html

    ## Examples

        iex> for n <- [1, 2, 3, 4], do: n * n
        [1, 4, 9, 16]

        iex> for n <- 1..4, do: n * n
        [1, 4, 9, 16]

        iex> values = [good: 1, good: 2, bad: 3, good: 4]
        iex> for {:good, n} <- values, do: n * n
        [1, 4, 16]

        iex> multiple_of_3? = fn(n) -> rem(n, 3) == 0 end
        iex> for n <- 0..5, multiple_of_3?.(n), do: n * n
        [0, 9]

        Multiple generators can also be used to calculate the cartesian product of two lists:

        iex> for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
        [a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]

    """
end
