defmodule MyList do
  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def max([head | tail]) do
    reduce(tail, head, &bigger/2)
  end

  defp bigger(a, b) when a > b, do: a
  defp bigger(_a, b), do: b
end
