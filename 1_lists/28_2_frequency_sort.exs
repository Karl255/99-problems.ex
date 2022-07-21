# Sorting a list of lists according to length of sublists.
# Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their length frequency; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.

defmodule Problem28_2 do
  def length_sort(lists) do
    lists = lists
    |> Enum.map(&{&1, length(&1)})
    
    length_frequencies = lists
    |> Enum.map(&elem(&1, 1))
    #|> Enum.frequencies()
    |> frequencies()
    
    lists
    |> Enum.map(fn x -> {elem(x, 0), length_frequencies[elem(x, 1)]} end)
    |> Enum.sort(fn a, b -> elem(a, 1) < elem(b, 1) end)
    |> Enum.map(&elem(&1, 0))
  end

  def frequencies(list, freqs \\ %{})
  
  def frequencies([], freqs) do
    freqs
  end
  
  def frequencies([item | rest], freqs) do
    freqs = freqs
    |> Map.update(item, 1, &(&1 + 1))
    
    frequencies(rest, freqs)
  end
  
  def test(lists) do
    IO.puts("#{lists |> insp} -> #{lists |> length_sort |> insp}")
  end

  def insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem28_2.test([[1, 2, 3], [4, 5], [6, 7, 8], [9, 10], [11, 12, 13, 14], [15, 16], [17]])
