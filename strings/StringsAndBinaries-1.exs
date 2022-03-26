defmodule MyStrings do
  def is_only_ascii([]), do: true
  def is_only_ascii([ ascii_char | tail])
  when ascii_char >= 32 and ascii_char <= 126 do
    is_only_ascii(tail)
  end
  def is_only_ascii([ _ | _ ]), do: false
end
