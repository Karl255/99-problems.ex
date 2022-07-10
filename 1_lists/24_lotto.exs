# Draw N different random numbers from the set 1..M.
# The selected numbers shall be returned in a list.

defmodule Problem24 do
  def draw_random(n, max, acc \\ [])

  def draw_random(0, _max, acc) do
    acc
  end

  def draw_random(n, max, acc) do
    r = :rand.uniform(max + 1) - 1

    if r in acc do
      draw_random(n, max, acc)
    else
      draw_random(n - 1, max, [r | acc])
    end
  end

  def test(n, m) do
    IO.puts("#{n} from 1..#{m} -> #{draw_random(n, m) |> insp}")
  end

  defp insp(term, opts \\ [charlists: :as_lists]) do
    inspect(term, opts)
  end
end

Problem24.test(3, 10)
Problem24.test(3, 10)
Problem24.test(3, 10)
Problem24.test(4, 20)
Problem24.test(4, 20)
Problem24.test(4, 20)
Problem24.test(6, 49)
Problem24.test(6, 49)
Problem24.test(6, 49)
