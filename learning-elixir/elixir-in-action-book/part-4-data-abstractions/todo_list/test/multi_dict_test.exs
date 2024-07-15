defmodule MultiDictTest do
  use ExUnit.Case

  test "test new" do
    assert MultiDict.new() == %{}
  end

  test "add new" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    todo_list = MultiDict.new()
    |> MultiDict.add(some_date, some_value)
    assert todo_list == %{some_date=>[some_value]}
  end

  test "add entry update" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    new_value = "Go relax"
    todo_list = MultiDict.new()
    |> MultiDict.add(some_date, some_value)
    |> MultiDict.add(some_date, new_value)
    assert todo_list == %{some_date=>[new_value, some_value]}
  end

  test "get empty" do
    assert MultiDict.new()
    |> MultiDict.get(~D[2002-01-02]) == []
  end

  test "get full" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    assert MultiDict.new()
    |> MultiDict.add(some_date, some_value)
    |> MultiDict.get(some_date) == [some_value]
  end
end
