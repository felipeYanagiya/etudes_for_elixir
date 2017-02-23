defmodule Calculus do

  def derivative(funct, point) do
    delta = 1.0e-11
    (funct.(point + delta) - funct.(point)) / delta
  end
end
