defmodule MyList do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head)| map(tail, func)]

  def caesar(charlist, n) do
    map(charlist, &(Integer.mod(&1 + n - 97, 26) + 97))
    |> to_charlist
  end
end
