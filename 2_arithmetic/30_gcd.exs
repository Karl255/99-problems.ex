# Determine the greatest common divisor of two positive integer numbers

import Integer, only: [mod: 2]

defmodule Problem30 do
  def gcd(n, m) do
    if m === 0 do
      n
    else
      gcd(m, mod(n, m))
    end
  end

  def test(n, m) do
    IO.puts("#{n}, #{m} -> #{gcd(n, m)}")
  end
end

Problem30.test(13, 27)
Problem30.test(1, 2)
Problem30.test(7, 3)
Problem30.test(123, 99)
Problem30.test(1024, 4096)
Problem30.test(20536, 7826)
