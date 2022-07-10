# Pack consecutive duplicates of list elements into sublists.

defmodule Problem9 do
  def pack([]) do
    []
  end

  def pack([a]) do
    [a]
  end

  def pack(list) do
    pack(list, [])
    |> Enum.reverse()
  end

  defp pack([item | tail], []) do
    pack(tail, [[item]])
  end

  defp pack([], acc) do
    acc
  end

  defp pack(
         [item | tail],
         [[previous | _] = acc_head | acc_tail] = acc
       ) do
    if item === previous do
      pack(tail, [[item | acc_head] | acc_tail])
    else
      pack(tail, [[item] | acc])
    end
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> pack |> inspect}")
  end
end

Problem9.test([])
Problem9.test([1, 2, 3])
Problem9.test([1, 2, 2, 3])
Problem9.test([1, 2, 2, 1, 1, 2, "3"])
Problem9.test([1, 1, 2, 2, "2", 1, 1, 2, "3", 3, 3, 3])
