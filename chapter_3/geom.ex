defmodule Geom do
  @moduledoc """
  Area/2 function returns calculation of retangule area
  By default, we have a length = 1 and width = 1 retangule
  """
  def area(which, a, b) do
    case which do
      :rectangle -> a * b
      :triangle -> a * b / 2
      :ellipse -> :math.pi * a * b
    end
  end

end
