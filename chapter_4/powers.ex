import Kernel, except: [raise: 2, raise: 3]

defmodule Powers do
  def raise(base, exp) do
    cond do
      exp == 0 -> 1
      base == 1 -> base
      exp > 0 -> raise(base, exp, 1)
      exp < 0 -> 1 / raise(base, -exp)
    end
  end

  def raise(base, exp, acc) do
    cond do
      exp == 0 -> acc
      exp > 0 -> raise(base, exp - 1, base * acc)
    end
  end

  def nth_root(x, n, a) do
    IO.puts("Current guess is #{a}")
    f = raise(a, n) - x
    f_prime = n * raise(a, n - 1)
    next = a - f / f_prime
    change = abs(next - a)

    if change < 1.0e-8 do
      next
    else
      nth_root(x, n, next)
    end
  end

  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end
end
