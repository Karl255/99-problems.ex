# Generate a random permutation of the elements of a list.

defmodule Problem25 do
  def random_permutation(list) do
    random_permutation(list, [])
  end

  defp random_permutation([], acc) do
    acc
  end

  defp random_permutation(list, acc) do
    i = :rand.uniform(list |> length) - 1

    # replace pop/2 with List.pop_at/3 for better performance
    random_permutation(list |> pop(i), [list |> at(i) | acc])
  end

  defp pop([_ | tail], 0) do
    tail
  end

  defp pop([head | tail], i) do
    [head | pop(tail, i - 1)]
  end

  defp at([head | _], 0) do
    head
  end

  defp at([_ | tail], i) do
    at(tail, i - 1)
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> random_permutation |> inspect}")
  end
end

Problem25.test([])
Problem25.test([:a])
Problem25.test([1, 2, 3, 4, 5, 6, 7])
Problem25.test([1, 2, 3, 4, 5, 6, 7])
Problem25.test([1, 2, 3, 4, 5, 6, 7])
Problem25.test([1, 2, 3, 4, 5, 6, 7])
