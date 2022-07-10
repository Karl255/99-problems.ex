# Find the N'th element of a list.

defmodule Problem3 do
  def nth([], _) do
    nil
  end
  
  def nth(list, n) do
    [head | tail] = list
    
    if n === 0 do
      head
    else
      nth(tail, n - 1)
    end
  end

  def test(list, n) do
    IO.puts("#{list |> inspect} at #{n} -> #{nth(list, n) |> inspect}")
  end
end

Problem3.test([], 0)
Problem3.test([1], 0)
Problem3.test([1], 1)
Problem3.test([1, 2, 3], 2)
Problem3.test(["string", :atom, ["list"], :d, :e, :f], 1)
Problem3.test(["string", :atom, ["list"], :d, :e, :f], 5)
