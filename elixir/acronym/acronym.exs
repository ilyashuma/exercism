defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do

    ~r{[A-Z][a-z]+|[a-z]+}
    |> Regex.scan(string)
    |> Enum.flat_map(&(&1))
    |> Enum.map(&word_to_a_letter/1)
    |> Enum.join()

  end

  defp word_to_a_letter(word) do
    word
    |> String.capitalize()
    |> String.first()
  end

end
