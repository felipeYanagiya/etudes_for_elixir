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
end
