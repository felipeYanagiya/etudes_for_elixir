defmodule Geom do
  @moduledoc """
  Area/2 function returns calculation of retangule area
  By default, we have a length = 1 and width = 1 retangule
  """
  def area(which, a, b) do
    case which do
      :rectangle when a > 0 and b > 0 -> a * b
      :triangle when a > 0 and b > 0 -> a * b / 2
      :ellipse when a > 0 and b > 0 -> :math.pi * a * b
      _ -> 0
    end
  end

end
