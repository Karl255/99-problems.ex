# Remove the N'th element from a list.
# The first element of the list is numbered 0, the second 1,...

defmodule Problem20 do
  def remove_at([_removed | tail], 0) do
    tail
  end
  
  def remove_at([head | tail], n) do
    [head | remove_at(tail, n - 1)]
  end

  def test(list, n) do
    IO.puts("#{list |> inspect} at #{n} -> #{remove_at(list, n) |> inspect}")
  end
end

Problem20.test([1, 2, 3, 4], 0)
Problem20.test([1, 2, 3, 4], 1)
Problem20.test([1, 2, 3, 4], 2)
Problem20.test([1, 2, 3, 4], 3)
