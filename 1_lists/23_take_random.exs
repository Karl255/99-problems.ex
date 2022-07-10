# Extract a given number of randomly selected elements from a list
# The selected items shall be returned in a list. We use the Random module but do not initialize it with Random.self_init for reproducibility.

defmodule Problem23 do
  def take_random(list, n) do
    indecies = gen_random_unique(n, length(list) - 1)
    take_random(list, indecies, 0, [])
  end

  defp take_random(_items, [], _i, taken) do
    Enum.reverse(taken)
  end

  defp take_random([current | tail], [next_i | indecies_tail] = indecies, i, taken) do
    if next_i === i do
      take_random(tail, indecies_tail, i + 1, [current | taken])
    else
      take_random(tail, indecies, i + 1, taken)
    end
  end

  def gen_random_unique(n, max, acc \\ [])

  def gen_random_unique(0, _max, acc) do
    Enum.sort(acc)
  end

  def gen_random_unique(n, max, acc) do
    r = :rand.uniform(max + 1) - 1

    if r in acc do
      gen_random_unique(n, max, acc)
    else
      gen_random_unique(n - 1, max, [r | acc])
    end
  end

  def test(list, n) do
    IO.puts("#{list |> inspect} (#{n}) -> #{take_random(list, n) |> insp}")
  end

  defp insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem23.test([1, 2, 3, 4, 5], 2)
Problem23.test([1, 2, 3, 4, 5], 2)
Problem23.test([1, 2, 3, 4, 5], 2)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8], 3)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8], 3)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8], 3)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 5)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 5)
Problem23.test([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 5)
