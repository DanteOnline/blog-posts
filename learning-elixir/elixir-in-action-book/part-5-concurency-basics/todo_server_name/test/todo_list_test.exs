defmodule TodoListTest do
  use ExUnit.Case

  @some_date ~D[2021-01-23]
  @some_title "some action"

  def list_with_entry() do
    TodoList.new()
    |> TodoList.add_entry(%{date: @some_date, title: @some_title})
  end

  test "new" do
    assert TodoList.new() == %TodoList{}
  end

  test "new with entries" do
    entries = [
      %{date: @some_date, title: @some_title}
    ]

    result = %TodoList{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: @some_date, title: @some_title}
      }
    }

    assert TodoList.new(entries) == result

  end

  test "add_entry" do

    result = %TodoList{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: @some_date, title: @some_title}
      }
    }

    assert list_with_entry() == result
  end

  test "todo server test" do
    todo_server = TodoServer.start()
    TodoServer.add_entry(%{date: @some_date, title: @some_title})

    result_entries = [%{id: 1, date: @some_date, title: @some_title}]
    assert TodoServer.entries(@some_date) == result_entries

    TodoServer.update_entry(1, &Map.put(&1, :title, "new title"))

    result_entries = [%{id: 1, date: @some_date, title: "new title"}]
    assert TodoServer.entries(@some_date) == result_entries

    TodoServer.delete_entry(1)
    assert TodoServer.entries(@some_date) == []

  end

  test "entries empty" do
    assert TodoList.new()
    |> TodoList.entries(@some_date) == []
  end

  test "entries" do
    assert list_with_entry()
    |> TodoList.entries(@some_date) == [%{id: 1, date: @some_date, title: @some_title}]
  end

  test "update entry error" do
    assert list_with_entry()
    |> TodoList.update_entry(
      5,
      &Map.put(&1, :date, ~D[2000-11-05])
    ) == list_with_entry()
  end

  test "update entry" do

    new_date = ~D[2000-11-05]

    result = %TodoList{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: new_date, title: @some_title}
      }
    }

    assert list_with_entry()
    |> TodoList.update_entry(
      1,
      &Map.put(&1, :date, new_date)
    ) == result
  end

  test "delete entry not found" do
    assert list_with_entry()
    |> TodoList.delete_entry(
      5
    ) == list_with_entry()
  end

  test "delete entry" do
    new_todo_list = list_with_entry()
    |> TodoList.delete_entry(
      1
    )
    assert new_todo_list.entries == %{}
  end

  test "generator" do
    entries = [
      %{date: ~D[2018-12-19], title: "Dentist"},
      %{date: ~D[2018-12-20], title: "Shopping"},
      %{date: ~D[2018-12-19], title: "Movies"}
      ]
    todo_list = for entry <- entries, into: TodoList.new(), do: entry
    result = %TodoList{
      auto_id: 4,
      entries: %{
        1 => %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
        2 => %{date: ~D[2018-12-20], id: 2, title: "Shopping"},
        3 => %{date: ~D[2018-12-19], id: 3, title: "Movies"}}
    }
    assert todo_list == result
  end

end
