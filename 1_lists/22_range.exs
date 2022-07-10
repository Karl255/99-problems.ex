# Create a list containing all integers within a given range
# If first argument is greater than second, produce a list in decreasing order.

defmodule Problem22 do
  def range(from, to) do
    cond do
      from < to -> [from | range(from + 1, to)]
      from > to -> [from | range(from - 1, to)]
      true -> [from]
    end
  end
  
  def test(from, to) do
    IO.puts("#{from}..#{to} -> #{range(from, to) |> inspect}")
  end
end

Problem22.test(1, 5)
Problem22.test(3, 3)
Problem22.test(5, 1)
