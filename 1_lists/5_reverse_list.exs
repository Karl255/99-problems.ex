# Reverse a list.

defmodule Problem5 do
  def reverse([]) do
    []
  end
  
  def reverse(list) do
    reverse(list, [])
  end
  
  defp reverse([], reversed) do
    reversed
  end
  
  defp reverse([head | tail], reversed) do
    reverse(tail, [head | reversed])
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> reverse |> inspect}")
  end
end

Problem5.test([])
Problem5.test([1])
Problem5.test([1, 2, 3])
Problem5.test(["string", :atom, ["list"], :d, :e, :f])
