defmodule Country do
  defstruct [:cities, :name, :language]
end

defmodule City do
  defstruct [:name, :population, :latitude, :longitude]
end

defprotocol Valid do
  @doc "Returns true if data is considered valid"
  def valid?(data)
end

defimpl Valid, for: City do
  def valid?(city) do
    city.population >= 0 and city.latitude >= -90 and city.latitude <= 90
      and city.longitude >= -180 and city.longitude <= 180
  end
end

defimpl Inspect, for: City do
  def inspect(city, args) do
    "#{city.name} #{city.population} #{city.latitude}°N #{city.longitude}°W"
  end
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

     %City{name: name, population: String.to_integer(pop), longitude: String.to_float(long), latitude: String.to_float(lat)}
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

  def total_population(glist, language) do
    Enum.filter(glist, fn cty -> cty.language == language end)
      |> Enum.map(fn country -> country.cities end)
      |> List.flatten
      |> Enum.reduce(0, fn (city, acc) -> city.population + acc end)
  end
end
