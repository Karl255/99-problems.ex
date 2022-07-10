# Write a function last : 'a list -> 'a option that returns the last element of a list

defmodule Problem1 do
  def last([]) do
    nil
  end

  def last([x]) do
    x
  end
  
  def last([_ | tail]) do
    last(tail)
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> last |> inspect}")
  end
end

Problem1.test([])
Problem1.test([1])
Problem1.test([1, 2, 3])
Problem1.test(["string", :atom, ["list"]])
