# Goldbach's conjecture

# Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers. Write a function to find the two prime numbers that sum up to a given even integer.

# TODO: less lazy implementation of this

import Integer, only: [mod: 2]

defmodule Problem38 do
  def goldbach(n) do
    if n > 2 and mod(n, 2) === 0 do
      goldbach(n - 2, 2)
    else
      nil
    end
  end

  defp goldbach(n, m) do
    cond do
      m < 2 -> nil
      prime?(n) and prime?(m) -> {n, m}
      true -> goldbach(n - 1, m + 1)
    end
  end

  # from 29
  def prime?(n) do
    prime?(n, 2)
  end

  defp prime?(n, i) do
    cond do
      i > n / 2 -> true
      mod(n, i) === 0 -> false
      true -> prime?(n, i + 1)
    end
  end

  def test(n) do
    IO.puts("#{n} -> #{n |> goldbach |> inspect}")
  end
end

Problem38.test(28)
Problem38.test(4)
Problem38.test(10)
Problem38.test(112)
