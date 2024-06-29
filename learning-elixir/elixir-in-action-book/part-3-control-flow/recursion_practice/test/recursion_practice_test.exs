defmodule RecursionPracticeTest do
  use ExUnit.Case

  test "list_len empty list" do
    assert RecursionPractice.list_len([]) == 0
  end

  test "list_len/1" do
    assert RecursionPractice.list_len([1,2,3]) == 3
  end

  test "range same numbers" do
    assert RecursionPractice.range(2,2) == [2]
  end

  test "range/2" do
    assert RecursionPractice.range(2,5) == [2,3,4,5]
  end

  test "positive empty list" do
    assert RecursionPractice.positive([]) == []
  end

  test "positive/1" do
    assert RecursionPractice.positive([1, -1, 2]) == [1,2]
  end
end
