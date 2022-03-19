defmodule MyEnum do
  def span(to, to), do: [to]
  def span(from, to) when from < to, do: [from | span(from + 1, to)]

  def primaries(n) do
    for x <- span(2, n), is_primary(x), do: x
  end

  def is_primary(2), do: true
  def is_primary(n) when n > 2 do
    (for p <- span(2, n - 1), rem(n, p) == 0, do: p)
    |> Enum.empty?
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ]
]

(
  for order <- orders do
    if rate = tax_rates[order[:ship_to]] do
      order ++ [ total_amount: order[:net_amount] * (1 + rate)]
    else
      order
    end
  end
) |> IO.inspect
