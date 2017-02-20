defmodule AskArea do
  defp char_to_shape(char) do
    case String.upcase(String.first(char)) do
      "R" -> :rectangle
      "T" -> :triangle
      "E" -> :ellipse
      _ -> IO.puts "Unknown shape #{char}"
    end
  end

  defp get_number(entry) do
    String.to_integer String.strip entry, 10
  end

  defp calculate(shape, dim1, dim2) do
    cond do
      dim1 <= 0 or dim2 <= 0 -> IO.puts "Both numbers must be greater than or equal to zero."
      true -> Geom.area {shape,dim1, dim2}
    end
  end

  def get_first_number(shape) do
    cond do
      shape == :rectangle -> get_number IO.gets "Enter width > "
      shape == :triangle -> get_number IO.gets "Enter base > "
      shape == :ellipse -> get_number IO.gets "Enter major radius > "
      true -> :ok
    end
  end

  defp get_second_number(shape) do
    cond do
      shape == :rectangle -> get_number IO.gets "Enter height > "
      shape == :triangle -> get_number IO.gets "Enter height > "
      shape == :ellipse -> get_number IO.gets "Enter minor radius > "
      true -> :ok
    end
  end

  def area() do
    shape = char_to_shape IO.gets "R)ectangle, T)riangle, or E)llipse: "
    dim1 = get_first_number shape
    dim2 = get_second_number shape
    calculate shape, dim1, dim2
  end
end
