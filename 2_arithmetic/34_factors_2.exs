# Determine the prime factors of a given positive integer (2)

# Construct a list containing the prime factors and their multiplicity. Hint: The problem is similar to problem Run-length encoding of a list (direct solution).

import Integer, only: [mod: 2]

defmodule Problem34 do
  def factors(x) do
    factors(x, [{2, 0}])
    |> Enum.reverse()
  end

  defp factors(x, [{i, n} | acc_tail] = acc) do
    cond do
      i > x ->
        acc

      mod(x, i) === 0 ->
        factors(div(x, i), [{i, n + 1} | acc_tail])

      n === 0 ->
        factors(x, [{i + 1, 0} | acc_tail])

      true ->
        factors(x, [{i + 1, 0} | acc])
    end
  end

  def test(x) do
    IO.puts("#{x} -> #{x |> factors |> inspect(charlists: :as_lists)}")
  end
end

Problem34.test(10)
Problem34.test(64)
Problem34.test(123)
Problem34.test(315)
