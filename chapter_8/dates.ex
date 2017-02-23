defmodule Dates do
  def date_parts(date) do
    Enum.map(String.split(date, "-"), fn(str) -> String.to_integer(str) end)
  end

  defp month_total(month) do
    {months_to_calc, _rest} = Enum.split([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], month - 1)
    List.foldl(months_to_calc, 0, fn (x, acc) -> x + acc end)
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

  defp calculate_days([year, month, day]) do
    days = month_total(month) + day

    cond do
      is_leap_year(year) and month > 2 -> 1 + days
      true -> days
    end
  end

  def julien(date) do
    calculate_days(date_parts(date))
  end
end
