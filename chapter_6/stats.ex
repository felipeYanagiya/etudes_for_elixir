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
end
