defmodule MyString do
  def load_orders_from(file_path) do
    open_csv(file_path)
    |> load_orders
  end

  defp open_csv(file_path) do
    file = File.open!(file_path, [:read])
    header = IO.read(file, :line)
    rows = IO.stream(file, :line)

    { header, rows }
  end

  defp load_orders(csv) do
    {header, rows} = csv

    Enum.map(rows, &(String.split(&1, ",") |> List.to_tuple))
    |> Enum.map(fn ({id, ship_to, net_amount}) -> [id: to_i(id), ship_to: to_atom(ship_to), net_amount: to_f(net_amount) ] end)
  end

  defp to_i(str) do
    str
    |> String.trim_trailing
    |> String.to_integer
  end

  defp to_f(str) do
    str
    |> String.trim_trailing
    |> String.to_float
  end

  defp to_atom(str) do
    str
    |> String.trim_leading(":")
    |> String.to_atom
  end
end
