defmodule BeerSong do

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)

  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do

    number_of_bottles = bottles(number)
    what_to_do = what_to_do(number)
    number_of_bottles_left = bottles(reduce(number))

    """
    #{capitalize(number_of_bottles)} of beer on the wall, #{number_of_bottles} of beer.
    #{capitalize(what_to_do)}, #{number_of_bottles_left} of beer on the wall.
    """

  end

  @spec what_to_do(integer) :: String.t()
  defp what_to_do(0), do: "Go to the store and buy some more"
  defp what_to_do(1), do: "Take it down and pass it around"
  defp what_to_do(_), do: "Take one down and pass it around"

  @spec bottles(integer) :: String.t()
  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(number), do: to_string(number) <> " bottles"

  @spec bottles(integer) :: integer
  defp reduce(0), do: 99
  defp reduce(number), do: number - 1

  @spec bottles(String.t()) :: String.t()
  defp capitalize(string), do:
    String.capitalize(string)

end