defmodule Cards do
  def make_deck do
    for x <- ["A","2","3","4","5","6","7","8","9","10","J","Q","K"], y <- ["Clubs", "Hearts", "Diamonds", "Spades"], do: {x, y}
  end

  def shuffle(list) do
    :rand.seed(:erlang.now())
    shuffle(list, [])
  end

  def shuffle([], acc) do
    acc
  end

  def shuffle(list, acc) do
    {leading, [h | t]} =
      Enum.split(list, :rand.uniform(Enum.count(list)) - 1)
      shuffle(leading ++ t, [h | acc])
  end
end
