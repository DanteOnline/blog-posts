defmodule RecursionPractice do
  def list_len([]), do: 0
  def list_len([head | tail]) do
    1 + list_len(tail)
  end

  def range(n, n), do: [n]
  def range(from, to) do
    range(from, from) ++ range(from+1, to)
  end

  def positive([]), do: []
  def positive([head | tail]) do
    if head > 0 do
      [head | positive(tail)]
    else
      positive(tail)
    end
  end
end
