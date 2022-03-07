defmodule MyEnum do
  def flatten([]), do: []
  def flatten([list = [_ | _] | tail]), do: flatten(flatten(list) ++ tail)
  def flatten([head | tail]), do: [head | flatten(tail)]
end
