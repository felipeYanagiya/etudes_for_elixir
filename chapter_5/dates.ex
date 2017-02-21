defmodule Dates do
  def date_parts(date) do
    Enum.map(String.split(date, "-"), fn(str) -> String.to_integer(str) end)
  end
end
