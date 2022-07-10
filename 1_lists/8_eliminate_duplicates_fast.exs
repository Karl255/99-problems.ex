# Eliminate consecutive duplicates of list elements.

# this version is tail recursive meaning it executes a lot faster than the other version and doesn't have the chance of overflowing the stack

defmodule Problem8Fast do
  def eliminate(list) do
    eliminate(list, [])
    |> Enum.reverse()
  end

  defp eliminate([], acc) do
    acc
  end
  
  defp eliminate([item | tail], []) do
    eliminate(tail, [item])
  end
  
  defp eliminate([item | tail], [last | _] = acc) do
    if item === last do
      eliminate(tail, acc)
    else
      eliminate(tail, [item | acc])
    end
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> eliminate |> inspect}")
  end
end

Problem8Fast.test([])
Problem8Fast.test([1, 2, 3])
Problem8Fast.test([1, 2, 2, 3])
Problem8Fast.test([1, 2, 2, 1, 1, 2, "3"])
Problem8Fast.test([1, 1, 2, 2, "2", 1, 1, 2, "3", 3, 3, 3])
