# Modify the result of the previous problem in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

defmodule Problem11 do
  def encode(list) do
    encode(list, [])
    |> Stream.map(fn
      {1, x} -> x
      x -> x
    end)
    |> Enum.reverse()
  end

  defp encode([], acc) do
    acc
  end

  defp encode([item | tail], []) do
    encode(tail, [{1, item}])
  end

  defp encode([item | tail], [{n, previous} | acc_tail] = acc) do
    if item === previous do
      encode(tail, [{n + 1, item} | acc_tail])
    else
      encode(tail, [{1, item} | acc])
    end
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> encode |> inspect}")
  end
end

Problem11.test([])
Problem11.test([:a, :b, :c])
Problem11.test([:a, :b, :b, :c])
Problem11.test([:a, :b, :b, :a, :a, :b, "c"])
Problem11.test([:a, :a, :b, :b, "b", :a, :a, :b, "c", :c, :c, :c])
