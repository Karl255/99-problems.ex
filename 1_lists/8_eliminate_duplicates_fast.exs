# Eliminate consecutive duplicates of list elements.

# this version is tail recursive meaning it executes a lot faster than the other version

defmodule Problem8_fast do
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

Problem8_fast.test([])
Problem8_fast.test([1, 2, 3])
Problem8_fast.test([1, 2, 2, 3])
Problem8_fast.test([1, 2, 2, 1, 1, 2, "3"])
Problem8_fast.test([1, 1, 2, 2, "2", 1, 1, 2, "3", 3, 3, 3])
