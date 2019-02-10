defmodule ListOps do

  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @moduledoc false

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end
  defp count([], len), do: len
  defp count([_|t], len), do: count(t, len + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end
  defp reverse([], acc), do: acc
  defp reverse([h|t], acc) do
    reverse(t, [h|acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end
  defp map([], _, acc), do: reverse(acc)
  defp map([h|t], f, acc) do
    map(t, f, [f.(h)|acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end
  defp filter([], f, acc), do: reverse(acc)
  defp filter([h|t], f, acc) do
    case f.(h) do
      true -> filter(t, f, [h|acc])
      false -> filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    append(a, b, [])
  end

  defp append([], [], acc), do: reverse(acc)
  defp append([], [h|t], acc), do:
    append([], t, [h|acc])
  defp append([h|t], b, acc), do:
    append(t, b, [h|acc])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll
    |> reduce([], &reduce(&1, &2, fn(a,b) -> [a|b] end))
    |> reverse()
  end

end
