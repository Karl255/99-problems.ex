# Eliminate consecutive duplicates of list elements.

defmodule Problem8 do
  def eliminate([]) do
    []
  end
  
  def eliminate([a]) do
    [a]
  end
  
  def eliminate([a | ([b | _] = tail)]) do
    if a === b do
      eliminate(tail)
    else
      [a | eliminate(tail)]
    end
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> eliminate |> inspect}")
  end
end

Problem8.test([])
Problem8.test([1, 2, 3])
Problem8.test([1, 2, 2, 3])
Problem8.test([1, 2, 2, 1, 1, 2, "3"])
Problem8.test([1, 1, 2, 2, "2", 1, 1, 2, "3", 3, 3, 3])
