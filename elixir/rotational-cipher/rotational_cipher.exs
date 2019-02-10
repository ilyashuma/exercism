defmodule RotationalCipher do

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  import String, only: [downcase: 1, upcase: 1]

  @ab "abcdefghijklmnopqrstuvwxyz"

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()

  def rotate(text, shift) do

    text
    |> codepoints()
    |> Enum.map(&(shift_codepoint(&1, shift)))
    |> Enum.join()

  end

  defp shift_codepoint(codepoint, shift), do:
    shift_codepoint(codepoint, shift, shiftable_codepoint?(codepoint))

  defp shift_codepoint(codepoint, shift, true) do

    index = Enum.find_index(ab(), &(&1 == downcase(codepoint)))
    new_char = Enum.at(ab(), rotate_index(index, shift))

    maybe_capitalize(codepoint, new_char)

  end

  defp shift_codepoint(codepoint, _, false), do: codepoint


  defp shiftable_codepoint?(codepoint), do:
    Enum.member?(ab(), downcase(codepoint))

  defp maybe_capitalize(a, b) do
    case String.capitalize(a) do
      ^a -> upcase(b)
       _ -> b
    end
  end

  def rotate_index(index, shift) do

    index = index + shift

    case index > length(ab()) - 1 do
      true -> index - 26
      false -> index
    end

  end

  defp codepoints(string), do:
    String.codepoints(string)

  defp ab(), do:
    codepoints(@ab)


end
