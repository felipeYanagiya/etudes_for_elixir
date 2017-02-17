defmodule Geom do
  @moduledoc """
  Area/1 function returns calculation of geometry form area
  """
  # defp area(which, a, b) do
  #   case which do
  #     :rectangle when a > 0 and b > 0 -> a * b
  #     :triangle when a > 0 and b > 0 -> a * b / 2
  #     :ellipse when a > 0 and b > 0 -> :math.pi * a * b
  #     _ -> 0
  #   end
  # end

  defp area(:rectangle, w, d) do
    cond do
      w > 0 and d > 0 -> w * d
    end
  end

  defp area(:triangle, h, b) do
    cond do
      h > 0 and b > 0 -> h * b / 2
    end
  end

  defp area(:ellipse, minor, major) do
    cond do
      minor > 0 and major > 0 -> :math.pi * minor * major
    end
  end

  defp area(_, _, _) do
    0
  end

  def area({shape, number1, number2}) do
    area shape, number1, number2
  end

end
