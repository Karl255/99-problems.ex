# Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 0 (this is the way the List module numbers elements).

defmodule Problem18 do
  def slice(list, 0, to) do
    take(list, to + 1, [])
    |> Enum.reverse()
  end
  
  def slice([], from, to) do
    slice([], from - 1, to - 1)
  end
  
  def slice([_ | tail], from, to) do
    slice(tail, from - 1, to - 1)
  end
  
  defp take(_list, 0, acc) do
    acc
  end
  
  defp take([], n, acc) do
    take([], n - 1, [nil | acc])
  end
  
  defp take([item | tail], n, acc) do
    take(tail, n - 1, [item | acc])
  end
  
  def test(list, from, to) do
    IO.puts("#{list |> inspect} #{from}..#{to} -> #{slice(list, from, to) |> inspect}")
  end
end

Problem18.test([1, 2, 3, 4], 0, 1)
Problem18.test([1, 2, 3, 4], 1, 3)
Problem18.test([1, 2, 3, 4], 2, 4)
Problem18.test([1, 2, 3, 4], 3, 3)
Problem18.test([1, 2, 3, 4], 4, 4)
Problem18.test([1, 2, 3, 4], 5, 6)
