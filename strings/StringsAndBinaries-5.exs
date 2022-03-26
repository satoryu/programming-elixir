defmodule MyString do
  def center(words) do
    maximum_length = words |> Enum.map(&(String.length(&1))) |> Enum.max

    Enum.map(words, &(centering(&1, maximum_length)))
    |> Enum.each(fn (word) -> IO.puts(word) end)
  end

  defp centering(word, width) do
    indent_size = div(max(width - String.length(word), 0), 2)

    "#{String.duplicate(" ", indent_size)}#{word}"
  end
end
