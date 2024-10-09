defmodule HofTest do
  use ExUnit.Case
  doctest Hof

  test "tripler" do
    double = fn value -> value * value end
    assert 12 == Hof.tripler(2, double)
    assert 360 == Hof.tripler(6, fn(value) -> 20 * value end)
    assert 360 == Hof.tripler(6, &(20 * &1))
    assert -3.0 == Hof.tripler(:math.pi, &:math.cos(&1))
  end

  test "Enum.each" do
    assert :ok == Enum.each(["one", "two"], &IO.puts(&1))
  end

  test "Enum.map" do
    assert [1, 4, 9] == Enum.map([1, 2, 3], &(&1*&1))
  end

  test "list generator" do
    assert [1, 4, 9] == for value <- [1, 2, 3], do: value * value
  end

  test "enum filter" do
    four_bits = fn(value) -> (value >= 0) and (value < 16) end
    list = [1, 2, 4, 8, 16, 32]
    assert [1, 2, 4, 8] == Enum.filter(list, four_bits)
  end

  test "list generator with filter" do
    list = [1, 2, 4, 8, 16, 32]
    assert [1, 2, 4, 8] == for value <- list, value >= 0, value < 16, do: value
  end

  test "Enum all and eny" do
    assert true == Enum.all?([1,2,3], &is_integer(&1))
    assert false == Enum.all?([1,2.0,3], &is_integer(&1))
    assert true == Enum.any?([1,2.0,3], &is_integer(&1))
    assert false == Enum.any?([1.0,2.0,3.0], &is_integer(&1))
  end

  test "Enum partition" do
    assert {[11, 12], [1, 2, 3]} == Enum.split_with([1,2,3,11,12], &(&1>10))
    assert {[1,2], [3, 4,5]} == Enum.split_while([1,2,3,4,5], &(&1<3))
  end

  test "Enum foldl and foldr" do
    sumsq = fn(value, accumulator) -> accumulator + value * value end
    assert 56 == List.foldl([2, 4, 6], 0, sumsq)
    assert 56 == List.foldr([2, 4, 6], 0, sumsq)
  end
end
