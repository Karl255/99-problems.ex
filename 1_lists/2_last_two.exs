# Find the last but one (last and penultimate) elements of a list.

defmodule Problem2 do
  def last_2([]) do
    {nil, nil}
  end
  
  def last_2([_]) do
     {nil, nil}
  end
  
  def last_2([x, y]) do
    {x, y}
  end
  
  def last_2([_ | tail]) do
    last_2(tail)
  end

  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> last_2 |> inspect}")
  end
end

Problem2.test([])
Problem2.test([1])
Problem2.test([1, 2, 3])
Problem2.test(["string", :atom, ["list"]])
