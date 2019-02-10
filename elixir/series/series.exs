defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """

  @spec slices(s :: String.t(), size :: integer) :: list(String.t())

  def slices(s, size), do:
    slices(s, size, String.length(s))

  defp slices(s, size, slen) when size > 0 and slen >= size do
    for k <- Enum.to_list(0..(String.length(s) - size)) do
      String.slice(s, k, size)
    end
  end

  defp slices(s, size, slen), do: []

end
