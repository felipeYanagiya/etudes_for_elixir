defmodule Cards do
  def make_deck do
    for x <- ["A","2","3","4","5","6","7","8","9","10","J","Q","K"], y <- ["Clubs", "Hearts", "Diamonds", "Spades"], do: {x, y}
  end
end
