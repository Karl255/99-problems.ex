# Start counting list elements with 0. If the position is larger or equal to the length of the list, insert the element at the end. (The behavior is unspecified if the position is negative.)

# this version is tail recursive meaning it executes a lot faster than the other version and doesn't have the chance of overflowing the stack

defmodule Problem21Fast do
  def insert_at([], _at, item) do
    [item]
  end
  
  def insert_at(list, at, item) do
    move_aside(list, at, item, [])
  end
  
  defp move_aside(rest, 0, item, acc) do
    put_back([item | rest], acc)
  end
  
  defp move_aside([head | tail], at, item, acc) do
    move_aside(tail, at - 1, item, [head | acc])
  end
  
  defp put_back(list, []) do
    list
  end
  
  defp put_back(list, [head | tail]) do
    put_back([head | list], tail)
  end
  
  def test(list, n, item) do
    IO.puts("#{list |> inspect} at #{n} -> #{insert_at(list, n, item) |> inspect}")
  end
end

Problem21Fast.test([], 0, :x)
Problem21Fast.test([1, 2, 3, 4], 0, :x)
Problem21Fast.test([1, 2, 3, 4], 1, :x)
Problem21Fast.test([1, 2, 3, 4], 2, :x)
Problem21Fast.test([1, 2, 3, 4], 3, :x)
Problem21Fast.test([1, 2, 3, 4], 4, :x)
