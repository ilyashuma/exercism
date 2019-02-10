defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &nucleotide_re/1)
  end

  defp nucleotide_re(?A), do: ?U
  defp nucleotide_re(?C), do: ?G
  defp nucleotide_re(?T), do: ?A
  defp nucleotide_re(?G), do: ?C


end
