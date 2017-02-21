defmodule Dates do
  def date_parts(date) do
    Enum.map(String.split(date, "-"), fn(str) -> String.to_integer(str) end)
  end

  defp month_total(month, list, acc) do
    cond do
      month == 1 -> acc
      true -> month_total(month - 1, tl(list), acc + hd(list))
    end
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

  defp calculate_days([year, month, day]) do
    days = month_total(month, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], 0) + day
    cond do
      is_leap_year(year) and month > 2 -> 1 + days
      true -> days
    end
  end

  def julien(date) do
    calculate_days(date_parts(date))
  end
end
