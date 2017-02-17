import Kernel, except: [raise: 2]

defmodule Powers do
  def raise(base, exp) do
    cond do
      exp == 0 -> 1
      base == 1 -> base
      exp > 0 -> base * raise(base, exp - 1)
      exp < 0 -> 1 / raise(base, -exp)
    end
  end
end
