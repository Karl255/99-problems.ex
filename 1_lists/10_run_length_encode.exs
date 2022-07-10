# http://en.wikipedia.org/wiki/Run-length_encoding

defmodule Problem10 do
  def encode(list) do
    encode(list, [])
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

Problem10.test([])
Problem10.test([:a, :b, :c])
Problem10.test([:a, :b, :b, :c])
Problem10.test([:a, :b, :b, :a, :a, :b, "c"])
Problem10.test([:a, :a, :b, :b, "b", :a, :a, :b, "c", :c, :c, :c])
