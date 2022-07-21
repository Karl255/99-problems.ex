# Sorting a list of lists according to length of sublists.
# We suppose that a list contains elements that are lists themselves. The objective is to sort the elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.

defmodule Problem28_1 do
  def length_sort(lists) do
    lists
    # length/1 is slow and should be called as rarely as possible
    #|> Enum.sort(&(length(&1) < length(&2)))
    |> Enum.map(&{&1, length(&1)})
    |> Enum.sort(fn a, b -> elem(a, 1) < elem(b, 1) end)
    |> Enum.map(&elem(&1, 0))
  end

  def test(lists) do
    IO.puts("#{lists |> insp} -> #{lists |> length_sort |> insp}")
  end

  def insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem28_1.test([[1, 2, 3], [4, 5], [6, 7, 8], [9, 10], [11, 12, 13, 14], [15, 16], [17]])
