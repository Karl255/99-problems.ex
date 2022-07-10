# Find out whether a list is a palindrome.

defmodule Problem6 do
  def palindrome?(list) do
    list === Enum.reverse(list)
  end
  
  def test(list) do
    IO.puts("#{list |> inspect} -> #{list |> palindrome? |> inspect}")
  end
end

Problem6.test([])
Problem6.test([1])
Problem6.test([1, 2, 3])
Problem6.test([1, 2, 1])
Problem6.test(["string", :atom, ["list"], :d, :e, :f])
Problem6.test([:z, 2, 6, 2, :z])
