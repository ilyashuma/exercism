defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()

  def parse(string) do

    string
    |> String.split("\n")
    |> Enum.map_join(&process/1)
    |> enclose_ul()

  end

  defp process(str) do

    case String.first(str) do
      "#" -> enclose_header(str)
      "*" -> enclose_li(str)
      _ -> enclose_paragraph(str)
    end

  end

  @doc "process headers"
  defp enclose_header(str) do
    [h|t] = String.split(str)
    hl = String.length(h)
    t = Enum.join(t, " ")
    "<h#{hl}>#{t}</h#{hl}>"
  end

  @doc "process lists"
  defp enclose_li(str) do
    str = String.trim_leading(str, "* ")
    "<li>#{parse_tags(str)}</li>"
  end

  defp enclose_paragraph(str) do
    "<p>#{parse_tags(str)}</p>"
  end

  defp parse_tags(str) do

    re = [
      %{e: ~r/__(.+)__/, r: "<strong>\\1</strong>"},
      %{e: ~r/_(.+)_/, r: "<em>\\1</em>"}
    ]

    Enum.map(re, &(Regex.replace(&1.e, str, &1.r)))

  end

  defp enclose_ul(str) do
    l
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>","</li></ul>"
    )
  end

end
