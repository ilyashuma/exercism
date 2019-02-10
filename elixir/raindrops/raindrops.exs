defmodule Raindrops do

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @sounds %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @spec convert(pos_integer) :: String.t()

  def convert(number) do

    @sounds
    |> Map.keys()
    |> Enum.map(&(sound(number, &1)))
    |> Enum.join()
    |> result(number)

  end

  defp result("", number), do: to_string(number)
  defp result(string, _), do: string

  defp sound(number, factor)
       when rem(number, factor) == 0, do: @sounds[factor]
  defp sound(number, _), do: ""

end