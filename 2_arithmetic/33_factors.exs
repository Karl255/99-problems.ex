# Determine the prime factors of a given positive integer

# Construct a flat list containing the prime factors in ascending order.

import Integer, only: [mod: 2]

defmodule Problem33 do
  def factors(x) do
    factors(x, 2, [])
    |> Enum.reverse()
  end

  defp factors(x, i, acc) do
    cond do
      i > x ->
        acc

      mod(x, i) === 0 ->
        factors(div(x, i), i, [i | acc])

      true ->
        factors(x, i + 1, acc)
    end
  end

  def test(x) do
    IO.puts("#{x} -> #{x |> factors |> inspect(charlists: :as_lists)}")
  end
end

Problem33.test(10)
Problem33.test(64)
Problem33.test(123)
Problem33.test(315)
