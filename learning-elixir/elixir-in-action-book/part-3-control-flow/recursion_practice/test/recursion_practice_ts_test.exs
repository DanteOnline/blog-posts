defmodule RecursionPracticeTSTest do
  use ExUnit.Case

  test "list_len empty list" do
    assert RecursionPracticeTS.list_len([]) == 0
  end

  test "list_len/1" do
    assert RecursionPracticeTS.list_len([1,2,3]) == 3
  end

  test "range same numbers" do
    assert RecursionPracticeTS.range(2,2) == [2]
  end

  test "range/2" do
    assert RecursionPracticeTS.range(2,5) == [2,3,4,5]
  end

  test "positive empty list" do
    assert RecursionPracticeTS.positive([]) == []
  end

  test "positive/1" do
    assert RecursionPracticeTS.positive([1, -1, 2]) == [1,2]
  end
end
