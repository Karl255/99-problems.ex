# Determine whether a given integer number is prime

import Integer, only: [mod: 2]

defmodule Problem29 do
  def prime?(n) do
    prime?(n, 2)
  end

  defp prime?(n, i) do
    cond do
      i > n / 2 ->
        true

      mod(n, i) === 0 ->
        false

      true ->
        prime?(n, i + 1)
    end
  end

  def test(n) do
    IO.puts("#{n} -> #{n |> prime? && "prime" || "not prime"}")
  end
end

for i <- 1..10 do
  Problem29.test(i)
end
