defmodule MyString do
  def capitalize_sentence(sentence) do
    sentence
    |> String.split(". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end
end
