defmodule Stats do
  def minimum(list) do
    minimum(tl(list), hd(list))
  end

  def minimum(list, candidate) do
    if List.first(list) == nil do
      candidate
    else
      cond do
       candidate < hd(list) -> minimum(tl(list), candidate)
       true -> minimum(tl(list), hd(list))
      end
    end
  end

  def maximum(list) do
    maximum(tl(list), hd(list))
  end

  def maximum(list, candidate) do
    if List.first(list) == nil do
      candidate
    else
      cond do
       candidate > hd(list) -> maximum(tl(list), candidate)
       true -> maximum(tl(list), hd(list))
      end
    end
  end

  def range(list) do
    [minimum(list), maximum(list)]
  end

  def mean(list) do
    length = Enum.count(list)
    cond do
      length > 0 -> List.foldl(list, 0, fn (x, acc) -> x + acc end)/ length
      true -> 0
    end
  end

  def stdv(list) do
    n = Enum.count(list)
    {sum, sum_squares} = List.foldl(list, {0, 0}, fn (x, {sum_acc, square_acc}) -> {x + sum_acc, x * x + square_acc} end)
    :math.sqrt((n * sum_squares - sum * sum) / (n * (n - 1)))
  end

end
