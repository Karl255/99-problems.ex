# Remove the N'th element from a list.
# The first element of the list is numbered 0, the second 1,...

# this version is tail recursive meaning it executes a lot faster than the other version and doesn't have the chance of overflowing the stack

defmodule Problem20Fast do
  def remove_at(list, n) do
    move_aside(list, n, [])
  end
  
  defp move_aside([_removed | list], 0, acc) do
    put_back(list, acc)
  end
  
  defp move_aside([head | tail], n, acc) do
    move_aside(tail, n - 1, [head | acc])
  end
  
  defp put_back(list, []) do
    list
  end
  
  defp put_back(list, [item | tail]) do
    put_back([item | list], tail)
  end
  
  def test(list, n) do
    IO.puts("#{list |> inspect} at #{n} -> #{remove_at(list, n) |> inspect}")
  end
end

Problem20FastFast.test([1, 2, 3, 4], 0)
Problem20Fast.test([1, 2, 3, 4], 1)
Problem20Fast.test([1, 2, 3, 4], 2)
Problem20Fast.test([1, 2, 3, 4], 3)
