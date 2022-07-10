# Flatten a nested list structure.

defmodule Problem7 do
  def flatten(list) do
    flatten(list, [])
    |> Enum.reverse()
  end
  
  defp flatten([], acc) do
    acc
  end
  
  defp flatten([nested | tail], acc) when is_list(nested) do
    flatten(tail, flatten(nested, acc))
  end
  
  defp flatten([item | tail], acc) do
    flatten(tail, [item | acc])
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> flatten |> inspect}")
  end
end

Problem7.test([])
Problem7.test([1, 2, 3])
Problem7.test([1, 2, [:x, :y], 3])
Problem7.test([[1, 2], 3, 4])
Problem7.test([1, 2, [:x, :y, [:z, :w]], 3])
Problem7.test(["string", :atom, ["list"]])
