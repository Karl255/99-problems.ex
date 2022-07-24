# Determine whether two positive integer numbers are coprime

import Integer, only: [gcd: 2]

defmodule Problem31 do
  def coprime?(n, m) do
    # let's imagine this is the function from the previous problem
    gcd(n, m) === 1
  end

  def test(n, m) do
    IO.puts("#{n}, #{m} -> #{coprime?(n, m)}")
  end
end

Problem31.test(13, 27)
Problem31.test(1, 2)
Problem31.test(7, 3)
Problem31.test(123, 99)
Problem31.test(1024, 4096)
Problem31.test(20536, 7826)
