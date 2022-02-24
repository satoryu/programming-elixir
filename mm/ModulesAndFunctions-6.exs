defmodule Chop do
  def guess(actual, range) do
    _guess(actual, range, estimate(range))
  end

  def _guess(actual, x.._, estimated) when actual < estimated do
    range = x..estimated
    _guess(actual, range, estimate(range))
  end
  def _guess(actual, _..y, estimated) when actual > estimated do
    range = (estimated+1)..y
    _guess(actual, range, estimate(range))
  end
  def _guess(_, _.._, estimated) do
    estimated
  end


  def estimate(x..y) do
    estimated = div(y - x, 2) + x
    IO.puts "Is it #{estimated}"
    estimated
  end
end
