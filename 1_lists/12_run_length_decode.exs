# Given a run-length code list generated as specified in the previous problem, construct its uncompressed version.

defmodule Problem12 do
  def decode(list) do
    decode(list, [])
    |> Enum.reverse()
  end
  
  defp decode([], acc) do
    acc
  end
  
  defp decode([{n, item} | tail], acc) do
    if n === 1 do
      decode(tail, [item | acc])
    else
      decode([{n - 1, item} | tail], [item | acc])
    end
  end
  
  defp decode([single | tail], acc) do
    decode(tail, [single | acc])
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> decode |> inspect}")
  end
end

Problem12.test([])
Problem12.test([{1, :a}, {1, :b}, {1, :c}])
Problem12.test([{1, :a}, {2, :b}, {1, :c}])
Problem12.test([{1, :a}, {2, :b}, {2, :a}, {1, :b}, {1, "c"}])
Problem12.test([{2, :a}, {2, :b}, {1, "b"}, {2, :a}, {1, :b}, {1, "c"}, {3, :c}])

# modified run-length encoding
Problem12.test([:a, :b, :c])
Problem12.test([:a, {2, :b}, :c])
Problem12.test([:a, {2, :b}, {2, :a}, :b, "c"])
Problem12.test([{2, :a}, {2, :b}, "b", {2, :a}, :b, "c", {3, :c}])
