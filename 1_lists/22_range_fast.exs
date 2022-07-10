# Create a list containing all integers within a given range
# If first argument is greater than second, produce a list in decreasing order.

# this version is tail recursive meaning it executes a lot faster than the other version and doesn't have the chance of overflowing the stack

defmodule Problem22Fast do
  def range(from, to) do
    if from <= to do
      range_up(from, to, [])
    else
      range_down(from, to, [])
    end
  end
  
  defp range_up(from, to, acc) do
    if from === to do
      [to | acc]
    else
      range_up(from, to - 1, [to | acc])
    end
  end
  
  defp range_down(from, to, acc) do
    if from === to do
      [to | acc]
    else
      range_down(from, to + 1, [to | acc])
    end
  end
  
  def test(from, to) do
    IO.puts("#{from}..#{to} -> #{range(from, to) |> inspect}")
  end
end

Problem22Fast.test(1, 5)
Problem22Fast.test(3, 3)
Problem22Fast.test(5, 1)
