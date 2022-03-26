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

  def sales_tax(orders) do
    orders
    |> Enum.map(&(calculate_total_amount(&1)))
  end

  defp calculate_total_amount(order) do
    tax_rates = [ NC: 0.075, TX: 0.08 ]

    add_total_amount(order, tax_rates[order[:ship_to]])
  end

  defp add_total_amount(order, nil), do: order
  defp add_total_amount(order = [id: _, ship_to: _, net_amount: net_amount], rate) do
    order ++ [ total_amount: net_amount * (1 + rate) ]
  end
  defp add_total_amount(invalid_format_order), do: raise "Invalid Order Format: #{invalid_format_order}"
end

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ]
]

MyEnum.sales_tax(orders)
|> IO.inspect
