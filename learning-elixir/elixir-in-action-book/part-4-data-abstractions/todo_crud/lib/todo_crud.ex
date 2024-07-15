defmodule TodoList do

  defstruct auto_id: 1, entries: %{}

  def new() do
    %TodoList{}
  end

  def add_entry(todo_list, entry) do

    entry = Map.put(
      entry,
      :id,
      todo_list.auto_id
    )

    new_entries = Map.put(
      todo_list.entries,
      todo_list.auto_id,
      entry
    )

    %TodoList{
      todo_list |
      auto_id: todo_list.auto_id + 1,
      entries: new_entries
    }
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(
      fn {_, entry} -> entry.date == date end
    )
    |> Enum.map(
      fn {_, entry} -> entry end
    )
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error -> todo_list
      
    end
  end
end
