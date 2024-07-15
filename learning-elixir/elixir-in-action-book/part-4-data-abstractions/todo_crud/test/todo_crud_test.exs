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

  test "add_entry" do

    result = %TodoList{
      auto_id: 2,
      entries: %{
        1=>%{id: 1, date: @some_date, title: @some_title}
      }
    }

    assert list_with_entry == result
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
    ) == list_with_entry
  end

  # test "update entry" do

  #   new_date = ~D[2000-11-05]

  #   result = %TodoList{
  #     auto_id: 2,
  #     entries: %{
  #       1=>%{id: 1, date: new_date, title: @some_title}
  #     }
  #   }

  #   assert list_with_entry()
  #   |> TodoList.update_entry(
  #     1,
  #     &Map.put(&1, :date, new_date)
  #   ) == result
  # end

end
