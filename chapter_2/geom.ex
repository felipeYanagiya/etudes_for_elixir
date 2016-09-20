defmodule Geom do
  @moduledoc """
  Area/2 function returns calculation of retangule area
  By default, we have a length = 1 and width = 1 retangule
  """
  def area(length \\ 1, width \\ 1) do
    length * width
  end
end
