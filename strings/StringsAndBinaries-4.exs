defmodule MyString do
  def calculate(statement) do
    statement
    |> tokenize
    |> convert
    |> _calculate
  end

  defp tokenize(statement), do: _tokenize(statement, [], {})

  defp _tokenize([], token_charlist, tokens), do: Tuple.append(tokens, token_charlist)
  defp _tokenize([ ?\s | tail], token_charlist, tokens) do
    _tokenize(tail, [], Tuple.append(tokens, token_charlist))
  end
  defp _tokenize([ c | tail], token_charlist, tokens) do
    _tokenize(tail, token_charlist ++ [c], tokens)
  end

  defp number(str), do: _number_digits(str, 0)
  defp _number_digits([], value), do: value
  defp _number_digits([digit | tail], value)
  when digit in '0123456789' do
    _number_digits(tail, value * 10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _), do: raise "Invalid digit '#{[non_digit]}'"


  defp convert({number1, operator, number2}), do: { number(number1), operator, number(number2) }
  defp convert(invalid_tokens), do: raise "Invalid tokens: '#{invalid_tokens}'"

  defp _calculate({number1, '+', number2}), do: number1 + number2
  defp _calculate({number1, '-', number2}), do: number1 - number2
  defp _calculate({number1, '*', number2}), do: number1 * number2
  defp _calculate({number1, '/', number2}), do: number1 / number2
  defp _calculate({_, invalid_operator, _}), do: raise "Invalid Operater '#{[invalid_operator]}'"
end
