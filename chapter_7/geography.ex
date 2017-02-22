defmodule Country do
  defstruct [cities, name, language]
end

defmodule City do
  defstruct [name, population, latitude, longitude]
end

defmodule Geography do

  defp is_country(list) do
    Kernel.length(list) == 2
  end

  defp construct_city(list) do
    {name, _rest} = List.pop_at(list, 0)
    {pop, _rest} = List.pop_at(list, 1)
    {lat, _rest} = List.pop_at(list, 2)
    {long, _rest} = List.pop_at(list, 3)

    %City{name: name, population: pop, longitude: long, latitude: lat}
  end

  defp extract_data(line) do
    list = String.replace(line, "\n", "")
      |> String.split(",")

    cond do
      is_country(list) -> %Country{hd(list), List.flatten(tl(list))}
      true -> construct_city(list)
    end
  end

  defp read_all_lines(file, list) do
    line = IO.read(file, :line)

    cond do
      line == :eof -> list
      true -> read_all_lines(file, append_to_list(extract_data(line), map))
    end
  end

  def make_geo_list(file) do
    ### should abstract this code as default line reader
    { _result, file } = File.open(file, [:read, :utf8])
    read_all_lines(file, [])
  end
end
