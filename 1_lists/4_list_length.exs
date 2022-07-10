# Find the number of elements of a list.

defmodule Problem4 do
  def len(list) do
    len(list, 0)
  end

  defp len([], n) do
    n
  end

  defp len([_ | tail], n) do
    len(tail, n + 1)
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> len |> inspect}")
  end
end

Problem4.test([])
Problem4.test([1])
Problem4.test([1, 2, 3])
Problem4.test(["string", :atom, ["list"], :d, :e, :f])
