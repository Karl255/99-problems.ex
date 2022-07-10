# Rotate a list N places to the left.

defmodule Problem19 do
  def rotate_left(list, n) do
    rotate_left_p1(list, n, [])
  end
  
  defp rotate_left_p1(list, 0, acc) do
    rotate_left_p2(Enum.reverse(list), Enum.reverse(acc))
  end
  
  defp rotate_left_p1([head | tail], n, acc) do
    rotate_left_p1(tail, n - 1, [head | acc])
  end
  
  defp rotate_left_p2([], acc) do
    acc
  end
  
  defp rotate_left_p2([head | tail], acc) do
    rotate_left_p2(tail, [head | acc])
  end
  
  def test(list, n) do
    IO.puts("#{list |> inspect} << #{n} -> #{rotate_left(list, n) |> inspect}")
  end
end

Problem19.test([1, 2, 3, 4], 0)
Problem19.test([1, 2, 3, 4], 1)
Problem19.test([1, 2, 3, 4], 2)
Problem19.test([1, 2, 3, 4], 3)
Problem19.test([1, 2, 3, 4], 4)
