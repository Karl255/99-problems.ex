# Split a list into two parts; the length of the first part is given.
# If the length of the first part is longer than the entire list, then the first part is the list and the second part is empty.

defmodule Problem17 do
  def split_at(list, at) do
    split_at(list, at, [])
  end

  defp split_at(list, 0, first) do
    {Enum.reverse(first), list}
  end

  defp split_at([], _at, first) do
    {Enum.reverse(first), []}
  end

  # alternative behaviour
  #defp split_at([], at, first) do
  #  split_at([], at - 1, [nil | first])
  #end

  defp split_at([head | tail], at, first) do
    split_at(tail, at - 1, [head | first])
  end

  def test(list, at) do
    IO.puts("#{list |> inspect} at #{at} -> #{split_at(list, at) |> inspect}")
  end
end

Problem17.test([1, 2, 3, 4], 0)
Problem17.test([1, 2, 3, 4], 1)
Problem17.test([1, 2, 3, 4], 2)
Problem17.test([1, 2, 3, 4], 3)
Problem17.test([1, 2, 3, 4], 4)
Problem17.test([1, 2, 3, 4], 5)
