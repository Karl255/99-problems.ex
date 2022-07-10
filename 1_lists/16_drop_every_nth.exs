# Drop every N'th element from a list.

defmodule Problem16 do
  def drop_every(list, n) do
    drop_every(list, n, 1, [])
    |> Enum.reverse()
  end
  
  defp drop_every([], _n, _i, acc) do
    acc
  end
  
  defp drop_every([item | tail], n, i, acc) do
    if i === n do
      drop_every(tail, n, 1, acc)
    else
      drop_every(tail, n, i + 1, [item | acc])
    end
  end
  
  def test(list, n) do
    IO.puts("#{list |> inspect} every #{n} -> #{drop_every(list, n) |> inspect}")
  end
end

Problem16.test([], 2)
Problem16.test([1], 3)
Problem16.test([1, 2, 3], 2)
Problem16.test(["string", :atom, ["list"], :d, :e, :f], 2)
Problem16.test([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 4)
