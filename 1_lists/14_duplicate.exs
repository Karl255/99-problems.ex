# Duplicate the elements of a list.

defmodule Problem14 do
  def duplicate([]) do
    []
  end
  
  def duplicate([head | tail]) do
    [head | [head | duplicate(tail)]]
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> duplicate |> inspect}")
  end
end

Problem14.test([])
Problem14.test([1])
Problem14.test([1, 2, 3])
Problem14.test(["string", :atom, ["list"], :d, :e, :f])
