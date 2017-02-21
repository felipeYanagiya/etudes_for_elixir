defmodule NonFP do
  defp generate_tooth(chances) do
    cond do
      :rand.uniform() < chances -> generate_tooth(2, 6, [])
      true -> generate_tooth(3, 6, [])
    end
  end

  defp generate_tooth(_base_depth, 0, acc_list) do
    acc_list
  end

  defp generate_tooth(base_depth, num_items, acc_list) do
    generate_tooth(base_depth, num_items - 1, [base_depth + :rand.uniform(3) - 2 | acc_list])
  end

  defp generate_pockets([], _b, acc_list) do
    Enum.reverse(acc_list)
  end

  defp generate_pockets([h | t], chances, acc_list) do
    cond do
      h == 'F' -> generate_pockets(t, chances, [[0] | acc_list])
      true -> generate_pockets(t, chances, [generate_tooth(chances) | acc_list])
    end
  end

  def generate_pockets(tooth_list, chances) do
    generate_pockets(tooth_list, chances, [])
  end
end
