# Calculate Euler's totient function φ(m) (improved)

# See problem "Calculate Euler's totient function φ(m)" for the definition of Euler's totient function. If the list of the prime factors of a number m is known in the form of the previous problem then the function phi(m) can be efficiently calculated as follows: Let [(p1, m1); (p2, m2); (p3, m3); ...] be the list of prime factors (and their multiplicities) of a given number m. Then φ(m) can be calculated with the following formula:
# φ(m) = (p1 - 1) × p1m1 - 1 × (p2 - 1) × p2m2 - 1 × (p3 - 1) × p3m3 - 1 × ⋯

import Integer, only: [mod: 2]

defmodule Problem35 do
  def phi(x) do
    factors(x)
    |> Enum.reduce(1, fn {p, n}, acc -> acc * (p - 1) * p ** (n - 1) end)
  end

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
    IO.puts("#{x} -> #{x |> phi}")
  end
end

for i <- 10..50//10 do
  Problem35.test(i)
end

x = 10090
{time, result} = :timer.tc(&Problem35.phi/1, [x])
IO.puts("#{x} -> #{result} (took #{time}us)")
