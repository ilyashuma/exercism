defmodule Roman do

  @doc """
  Convert the number to a roman number.
  """

  @greek [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 6, 5, 4, 1]
  @roman ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "VI", "V", "IV", "I"]

  @spec numerals(pos_integer) :: String.t()

  def numerals(number) do
    numerals(number, @greek, [])
  end

  defp numerals(_, [], roman), do: Enum.join(roman)

  defp numerals(number, [g|reek], roman) when number / g >= 1.0 do

    roman = roman ++ for _ <- Enum.to_list(1..Integer.floor_div(number, g)) do
      Enum.at(@roman, Enum.find_index(@greek, &(&1 == g)))
    end

    number = number - Integer.floor_div(number, g) * g

    numerals(number, reek, roman)

  end

  defp numerals(number, [_|reek], acc), do:
    numerals(number, reek, acc)

end