# Generate a random permutation of the elements of a list.

defmodule Problem26 do
  def extract(list, n) do
    if n > 0 do
      extractp(list, n)
    else
      [[]]
    end
  end

  defp extractp(list, 1) do
    list |> Enum.map(fn x -> [x] end)
  end

  defp extractp([head | tail], n) do
    Enum.map(
      extract(tail, n - 1),
      fn x -> [head | x] end
    ) ++
      if length(tail) >= n do
        extract(tail, n)
      else
        []
      end
  end

  def test(list, n) do
    IO.puts("#{list |> inspect} (#{n}) -> #{list |> extract(n) |> inspect}")
  end
end

Problem26.test([], 1)
Problem26.test([:a], 0)
Problem26.test([:a], 1)
Problem26.test([:a], 2)
Problem26.test([1, 2, 3, 4], 1)
Problem26.test([1, 2, 3, 4], 2)
Problem26.test([1, 2, 3, 4, 5, 6, 7], 2)
Problem26.test([1, 2, 3, 4, 5, 6, 7], 3)
