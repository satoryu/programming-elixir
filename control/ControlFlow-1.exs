defmodule ControlFlow do
  def fizzbuzz(n) do
    Enum.map(1..n, &(_fizzbuzz(&1)))
  end

  defp _fizzbuzz(n) do
    case { rem(n, 3), rem(n, 5) } do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> n
    end
  end
end
