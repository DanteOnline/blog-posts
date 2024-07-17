defmodule TodoListCsvImporterTest do
  use ExUnit.Case

  @some_date ~D[2021-01-23]
  @some_title "some action"

  test "import" do
    entries = [
      %{date: @some_date, title: @some_title}
    ]

    result = %TodoList{
      auto_id: 4,
      entries: %{
        1 => %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
        2 => %{date: ~D[2018-12-20], id: 2, title: "Shopping"},
        3 => %{date: ~D[2018-12-19], id: 3, title: "Movies"}
      }
    }

    todo_list = TodoList.CsvImporter.import("todos.csv")

    assert todo_list == result

  end
end
