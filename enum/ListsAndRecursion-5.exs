# 練習問題 ListsAndRecursion-5
defmodule MyEnum do
  def all?([], _func), do: true
  def all?([head | tail], func), do: _all?(tail, func, func.(head))

  defp _all?([], _, _), do: true
  defp _all?([head | tail], func, true), do: _all?(tail, func, func.(head))
  defp _all?(_list, _func, false), do: false

  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter(list = [head | tail], func) do
    _filter(list, func, [])
  end

  defp _filter([], _, memory), do: memory
  defp _filter([head | tail], func, memory) do
    if func.(head) do
      _filter(tail, func, memory ++ [head])
    else
      _filter(tail, func, memory)
    end
  end

  def split([], _), do: [[], []]
  def split(list, n) do
    _split([], list, n)
  end

  defp _split(list, [], n) when n > 0, do: { list, [] }
  defp _split(list1, list2, 0), do: { list1, list2 }
  defp _split(list, [head | tail], n) do
    _split(list ++ [head], tail, n - 1)
  end

  def take(list, n) do
    _take([], list, n)
  end

  defp _take(memory, [], _n), do: memory
  defp _take(memory, _list, 0), do: memory
  defp _take(memory, [head | tail], n), do: _take(memory ++ [head], tail, n - 1)
end
