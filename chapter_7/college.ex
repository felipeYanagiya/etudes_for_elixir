defmodule College do
  defp extract_data(line) do
    String.replace(line, "\n", "")
      |> String.split(",")
      |> tl
      |> Enum.reverse()
  end

  defp append_to_map([classroom | course], map) do
    cond do
      Map.get(map, classroom) == nil -> Map.put(map, classroom, course)
      true -> Map.put(map, classroom, [hd(course) | Map.get(map, classroom)])
    end
  end

  defp read_all_lines(file, map) do
    line = IO.read(file, :line)
    cond do
      line == :eof -> map
      true -> read_all_lines(file, append_to_map(extract_data(line), map))
    end
  end

  def make_room_list(file) do
    { _result, device } = File.open(file, [:read, :utf8])
    result = read_all_lines(device, %{})
    IO.inspect(result)
    File.close(device)
  end
end
