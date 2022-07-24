# A list of prime numbers

# Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

# this is supposed to be the sieve of eratosthenes, I tried my best doing this in FP

defmodule Problem37 do
  def primes(from..to) do
    from..to
    |> Enum.with_index(from)
    |> terminate_non_primes(from..to, 2)
    |> Enum.count(fn {_, x} -> x !== 0 end)
  end

  defp terminate_non_primes(list, from..to, i) do
    first_elimination = max(2 * i, ceil(from / i) * i)

    if i * i > to do
      list
    else
      list
      # probably not the best way of doing this, but eh, it works
      |> Enum.map_reduce(first_elimination, fn {index, x}, acc ->
        if index === acc do
          {{index, 0}, acc + i}
        else
          {{index, x}, acc}
        end
      end)
      |> elem(0)
      |> terminate_non_primes(from..to, i + 1)
    end
  end

  def test(range) do
    IO.puts("#{range |> insp} -> #{range |> primes |> insp}")
  end

  defp insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem37.test(10..20)
Problem37.test(2..100)
Problem37.test(2..7920)
