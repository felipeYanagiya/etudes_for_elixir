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
    cond do
      Regex.match?(~r/^[1-9]([0-9]+)?$/, entry) -> String.to_integer String.strip entry, 10
      Regex.match?(~r/^\d\.([0-9]+)?$/, entry) -> String.to_float String.strip entry, 10
      true -> :error
    end
  end

  defp calculate(shape, dim1, dim2) do
    cond do
      dim1 <= 0 or dim2 <= 0 -> IO.puts "Both numbers must be greater than or equal to zero."
      true -> Geom.area {shape, dim1, dim2}
    end
  end

  defp get_dimensions(prompt1, prompt2) do
    num1 =  get_number IO.gets prompt1
    num2 = get_number IO.gets prompt2
    {num1, num2}
  end

  def area() do
    shape = char_to_shape IO.gets "R)ectangle, T)riangle, or E)llipse: "
    {num1, num2} =

    cond do
      shape == :rectangle -> get_dimensions "Enter height > ", "Enter height > "
      shape == :triangle -> get_dimensions "Enter base > ", "Enter height > "
      shape == :ellipse -> get_dimensions "Enter major radius > ", "Enter minor radius > "
      shape == :unknown -> IO.puts "bla"
      true -> :err
    end

    calculate shape, num1, num2
  end
end
