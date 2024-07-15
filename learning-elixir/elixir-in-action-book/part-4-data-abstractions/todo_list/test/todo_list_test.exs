defmodule TodoListTest do
  use ExUnit.Case

  test "test new" do
    assert TodoList.new() == %{}
  end

  test "add entry new" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    entry = %{date: some_date, title: some_value}
    todo_list = TodoList.new()
    |> TodoList.add_entry(entry)
    assert todo_list == %{some_date=>[entry]}
  end

  test "add entry update" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    some_entry = %{date: some_date, title: some_value}
    new_value = "Go relax"
    new_entry = %{date: some_date, title: new_value}
    todo_list = TodoList.new()
    |> TodoList.add_entry(some_entry)
    |> TodoList.add_entry(new_entry)
    assert todo_list == %{some_date=>[new_entry, some_entry]}
  end

  test "entries empty" do
    assert TodoList.new()
    |> TodoList.entries(~D[2002-01-02]) == []
  end

  test "entries full" do
    some_date = ~D[2002-01-02]
    some_value = "Go play game"
    entry = %{date: some_date, title: some_value}
    assert TodoList.new()
    |> TodoList.add_entry(entry)
    |> TodoList.entries(some_date) == [entry]
  end
end
