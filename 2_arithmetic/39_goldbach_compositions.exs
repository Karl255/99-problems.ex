# A list of Goldbach compositions

# Given a range of integers by its lower and upper limit, print a list of all even numbers and their Goldbach composition.
# In most cases, if an even number is written as the sum of two prime numbers, one of them is very small. Very rarely, the primes are both bigger than say 50. Try to find out how many such cases there are in the range 2..3000.

# TODO: less lazy implementation of this

import Integer, only: [mod: 2]

defmodule Problem39 do
  def goldbachs(from..to) do
    from = if mod(from, 2) === 0, do: from, else: from + 1
    
    from..to
    |> Enum.take_every(2)
    |> Enum.map(fn n -> {n, goldbach(n)} end)
  end
  
  # from 37
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

  def test(range) do
    IO.puts("#{range |> insp} -> #{range |> goldbachs |> insp}")
  end

  defp insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem39.test(9..20)
