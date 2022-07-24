# Calculate Euler's totient function φ(m)

# Euler's so-called totient function φ(m) is defined as the number of positive integers r (1 ≤ r < m) that are coprime to m. We let φ(1) = 1.
# Find out what the value of φ(m) is if m is a prime number. Euler's totient function plays an important role in one of the most widely used public key cryptography methods (RSA). In this exercise you should use the most primitive method to calculate this function (there are smarter ways that we shall discuss later).

import Integer, only: [gcd: 2]

defmodule Problem32 do
  def phi(x) do
    phi(x, 1, 0)
  end

  defp phi(x, i, n) do
    cond do
      i === x ->
        n

      gcd(x, i) === 1 ->
        phi(x, i + 1, n + 1)

      true ->
        phi(x, i + 1, n)
    end
  end

  def test(x) do
    IO.puts("#{x} -> #{x |> phi}")
  end
end

for i <- 10..50//10 do
  Problem32.test(i)
end

x = 10090
{time, result} = :timer.tc(&Problem32.phi/1, [x])
IO.puts("#{x} -> #{result} (took #{time}us)")
