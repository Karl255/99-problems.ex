# Replicate the elements of a list a given number of times.

defmodule Problem15 do
  def replicate(list, n) do
    replicate(list, n, [])
    |> Enum.reverse()
  end

  defp replicate([], _n, acc) do
    acc
  end
  
  defp replicate([item | tail], n, acc) do
    replicate(tail, n, prepend_n(item, n, acc))
  end
  
  defp prepend_n(item, n, acc) do
    if n > 0 do
      prepend_n(item, n - 1, [item | acc])
    else
      acc
    end
  end
  
  def test(list, n) do
    IO.puts("#{n} * #{list |> inspect} -> #{replicate(list, n) |> inspect}")
  end
end

Problem15.test([], 2)
Problem15.test([1], 3)
Problem15.test([1, 2, 3], 3)
Problem15.test(["string", :atom, ["list"], :d, :e, :f], 4)
