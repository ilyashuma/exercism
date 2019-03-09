defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    list = Tuple.to_list(numbers)
    do_search(list, key, 0)
  end

  defp do_search([], key, shift), do: :not_found
  defp do_search(list, key, shift) do

    index = floor(length(list) / 2)
    {h, t} = Enum.split(list, index)

    mid_val = List.last(h)

    cond do
      mid_val == key ->
        {:ok, shift + index - 1}

      hd(t) == key ->
        {:ok, shift + index}

      mid_val < key ->
        do_search(t, key, shift + index)

      mid_val > key ->
        do_search(h, key, shift)
    end

  end

end