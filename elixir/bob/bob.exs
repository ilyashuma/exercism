defmodule Bob do

  def hey(input) do

    cond do
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp shouting?(input) do
    (input == String.upcase(input)) && Regex.match?(~r/[[:alpha:]]/u, input)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp silence?(input) do
    String.trim(input) == ""
  end

end
