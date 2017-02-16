defmodule Geom do
  @moduledoc """
  Area/1 function returns calculation of geometry form area
  """
  defp area(which, a, b) do
    case which do
      :rectangle when a > 0 and b > 0 -> a * b
      :triangle when a > 0 and b > 0 -> a * b / 2
      :ellipse when a > 0 and b > 0 -> :math.pi * a * b
      _ -> 0
    end
  end

  def area({shape, number1, number2}) do
    area shape, number1, number2
  end

end
