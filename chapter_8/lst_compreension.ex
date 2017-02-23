defmodule ListCompreension do
  def exercise(people) do
    for {name, gender, age} <- people, (gender == "M" and age > 40), do: name
  end
end
