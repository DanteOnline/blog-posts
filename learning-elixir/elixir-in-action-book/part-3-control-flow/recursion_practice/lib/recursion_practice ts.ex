defmodule RecursionPracticeTS do
  def list_len(lst) do
    list_len_count(lst, 0)
  end

  def list_len_count([], count), do: count
  def list_len_count([head | tail], count) do
    list_len_count(tail, count+1)
  end

  def range(from, to) do
    range_agr(from, to, [])
  end

  def range_agr(n, n, result) do
    result ++ [n]
  end
  def range_agr(from, to, result) do
    range_agr(from+1, to, result ++ [from])
  end

  def positive(lst) do
    positive_agr(lst, [])
  end

  def positive_agr([], result), do: result
  def positive_agr([head | tail], result) do
    if head > 0 do
      positive_agr(tail, result++[head])
    else
      positive_agr(tail, result)
    end
  end
end
