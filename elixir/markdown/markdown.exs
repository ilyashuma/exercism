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

  @doc """
    It's better use pipe operator, it it now much easier to follow
  """

  def parse(m) do

    m
    |> String.split("\n")
    |> Enum.map(&process(&1))
    |> Enum.join()
    |> patch()

  end

  defp process(t) do

    case String.first(t) do
      "#" -> enclose_with_header_tag(parse_header_md_level(t))
      "*" -> parse_list_md_level(t)
      _ -> enclose_with_paragraph_tag(t)
    end

  end

  @doc "process headers"
  defp enclose_with_header_tag({hl, htl}) do
    "<h#{hl}>#{htl}</h#{hl}>"
  end

  defp parse_header_md_level(hwt) do
    [h|t] = String.split(hwt)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  @doc "process lists"
  defp parse_list_md_level(l) do
    t = String.trim_leading(l, "* ")
    "<li>#{join_words_with_tags(t)}</li>"
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp join_words_with_tags(t) do

    t = Regex.replace(~r/__(.+)__/, t, "<strong>\\1</strong>")
    Regex.replace(~r/_(.+)_/, t, "<em>\\1</em>")

  end

  defp patch(l) do
    l
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>","</li></ul>")
  end
end
