# Start counting list elements with 0. If the position is larger or equal to the length of the list, insert the element at the end. (The behavior is unspecified if the position is negative.)

defmodule Problem21 do
  def insert_at([], _at, item) do
    [item]
  end
  
  def insert_at(rest, 0, item) do
    [item | rest]
  end
  
  def insert_at([head | tail], at, item) do
    [head | insert_at(tail, at - 1, item)]
  end
  
  def test(list, n, item) do
    IO.puts("#{list |> inspect} at #{n} -> #{insert_at(list, n, item) |> inspect}")
  end
end

Problem21.test([], 0, :x)
Problem21.test([1, 2, 3, 4], 0, :x)
Problem21.test([1, 2, 3, 4], 1, :x)
Problem21.test([1, 2, 3, 4], 2, :x)
Problem21.test([1, 2, 3, 4], 3, :x)
Problem21.test([1, 2, 3, 4], 4, :x)
