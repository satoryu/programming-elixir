defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([ [time, 27, temp, rain] | tail]) do
    [ [time, 27, temp, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail]), do: for_location_27(tail)

  def test_data do
    [
      [135522, 26, 15, 0.125],
      [135522, 27, 15, 0.45],
      [135522, 28, 21, 0.25],
      [135522, 27, 17, 0.081]
    ]
  end
end
