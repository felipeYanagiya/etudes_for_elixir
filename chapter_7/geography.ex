defmodule Country do
  defstruct [:cities, :name, :language]
end

defmodule City do
  defstruct [:name, :population, :latitude, :longitude]
end

defmodule Geography do

  defp is_country(list) do
    Kernel.length(list) == 2
  end

  defp extract_city(city) do
    {name, _rest} = List.pop_at(city, 0)
    {pop, _rest} = List.pop_at(city, 1)
    {lat, _rest} = List.pop_at(city, 2)
    {long, _rest} = List.pop_at(city, 3)

     %City{name: name, population: pop, longitude: long, latitude: lat}
  end

  defp construct_city([country | others], city) do
    [%{ country | cities: [extract_city(city) | country.cities]} | others]
  end

  defp extract_line(line) do
    String.replace(line, "\n", "")
      |> String.split(",")
  end

  defp extract_data(line, result) do
    location_list = extract_line(line)

    cond do
      is_country(location_list) ->
        [ %Country{
            name: hd(location_list),
            language: hd(tl(location_list)),
            cities: []} | result ]
      true -> construct_city(result, location_list)
    end
  end

  defp read_all_lines(file, result) do
    line = IO.read(file, :line)

    cond do
      line == :eof -> result
      true -> read_all_lines(file, extract_data(line, result))
    end
  end

  def make_geo_list(file) do
    ### should abstract this code as default line reader
    { _result, file } = File.open(file, [:read, :utf8])
    read_all_lines(file, [])
  end
end
