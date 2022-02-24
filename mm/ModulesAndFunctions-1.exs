defmodule Times do
  def double(n), do: n * 2

  # ModuleAndFunctions-1
  def triple(n), do: n * 3

  # ModuleAndFunctions-3
  def quadruple(n), do: double(double(n))
end
