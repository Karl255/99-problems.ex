# Group the elements of a set into disjoint subsets
# 1. In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a function that generates all the possibilities and returns them in a list.
# 2. Generalize the above function in a way that we can specify a list of group sizes and the function will return a list of groups.

defmodule Problem27 do
  def group(list, [n]) do
    extract(list, n)
    |> Enum.map(&[&1])
  end

  def group(list, [n | rest]) do
    extract(list, n)
    |> Enum.flat_map(fn x ->
      group(list -- x, rest)
      |> Enum.map(fn y ->
        [x | y]
      end)
    end)
  end

  # from problem 26
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

  def test(list, groups) do
    IO.puts("#{list |> inspect} into #{groups |> inspect} -> #{list |> group(groups) |> inspect}")
  end
end

Problem27.test([1, 2], [1, 1])
Problem27.test([1, 2, 3], [2, 1])
Problem27.test([1, 2, 3, 4], [2, 1])
Problem27.test([1, 2, 3, 4], [2, 2])
Problem27.test([1, 2, 3, 4], [2, 1, 1])
