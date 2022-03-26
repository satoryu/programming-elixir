defmodule MyString do
  def anagram?(word1 ,word2) do
    normalize(word1) == normalize(word2)
  end

  defp normalize(word) do
    word
    |> ignore_spaces
    |> Enum.sort
  end
  defp ignore_spaces([]), do: []
  defp ignore_spaces([ ?\s | tail]), do: ignore_spaces(tail)
  defp ignore_spaces([ char | tail]), do: [ char | ignore_spaces(tail) ]
end
