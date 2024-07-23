defmodule TodoTest do
  use ExUnit.Case

  @some_date ~D[2021-01-23]
  @some_title "some action"

  def list_with_entry() do
    Todo.List.new()
    |> Todo.List.add_entry(%{date: @some_date, title: @some_title})
  end

  test "new" do
    assert Todo.List.new() == %Todo.List{}
  end

  test "new with entries" do
    entries = [
      %{date: @some_date, title: @some_title}
    ]

    result = %Todo.List{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: @some_date, title: @some_title}
      }
    }

    assert Todo.List.new(entries) == result

  end

  test "add_entry" do

    result = %Todo.List{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: @some_date, title: @some_title}
      }
    }

    assert list_with_entry() == result
  end

  # test "server_process" do
  #   {:ok, cache} = Todo.Cache.start_link(0)
  #   bob_pid = Todo.Cache.server_process("bob")
  #   assert bob_pid != Todo.Cache.server_process("alice")
  #   assert bob_pid == Todo.Cache.server_process("bob")
  # end

  test "todo server test" do
    {:ok, cache} = Todo.Cache.start_link(0)
    todo_server = Todo.Cache.server_process("Bob's list")

    # {:ok, todo_server} = Todo.Server.start()
    Todo.Server.add_entry(todo_server, %{date: @some_date, title: @some_title})

    result_entries = [%{id: 1, date: @some_date, title: @some_title}]
    assert Todo.Server.entries(todo_server, @some_date) == result_entries

    Todo.Server.update_entry(todo_server, 1, &Map.put(&1, :title, "new title"))

    result_entries = [%{id: 1, date: @some_date, title: "new title"}]
    assert Todo.Server.entries(todo_server, @some_date) == result_entries

    Todo.Server.delete_entry(todo_server, 1)
    assert Todo.Server.entries(todo_server, @some_date) == []

  end

  test "entries empty" do
    assert Todo.List.new()
    |> Todo.List.entries(@some_date) == []
  end

  test "entries" do
    assert list_with_entry()
    |> Todo.List.entries(@some_date) == [%{id: 1, date: @some_date, title: @some_title}]
  end

  test "update entry error" do
    assert list_with_entry()
    |> Todo.List.update_entry(
      5,
      &Map.put(&1, :date, ~D[2000-11-05])
    ) == list_with_entry()
  end

  test "update entry" do

    new_date = ~D[2000-11-05]

    result = %Todo.List{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: new_date, title: @some_title}
      }
    }

    assert list_with_entry()
    |> Todo.List.update_entry(
      1,
      &Map.put(&1, :date, new_date)
    ) == result
  end

  test "delete entry not found" do
    assert list_with_entry()
    |> Todo.List.delete_entry(
      5
    ) == list_with_entry()
  end

  test "delete entry" do
    new_todo_list = list_with_entry()
    |> Todo.List.delete_entry(
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
    todo_list = for entry <- entries, into: Todo.List.new(), do: entry
    result = %Todo.List{
      auto_id: 4,
      entries: %{
        1 => %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
        2 => %{date: ~D[2018-12-20], id: 2, title: "Shopping"},
        3 => %{date: ~D[2018-12-19], id: 3, title: "Movies"}}
    }
    assert todo_list == result
  end

end
