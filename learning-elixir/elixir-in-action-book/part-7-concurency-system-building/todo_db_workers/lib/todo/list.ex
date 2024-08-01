defmodule Todo.List do

  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %Todo.List{},
      &add_entry(&2, &1)
    )
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

    %Todo.List{
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

  defp find_entry(todo_list, entry_id) do
    Map.fetch(todo_list.entries, entry_id)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case find_entry(todo_list, entry_id) do
      :error -> todo_list
      {:ok, old_entry} ->
        new_entry = %{} = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %Todo.List{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do
    case find_entry(todo_list, entry_id) do
      :error -> todo_list
      {:ok, old_entry} ->
        new_entries = Map.delete(todo_list.entries, entry_id)
        %Todo.List{todo_list | entries: new_entries}
    end
  end

  defimpl Collectable, for: Todo.List do

    def into(original) do
      {original, &info_callback/2}
    end

    defp info_callback(todo_list, {:cont, entry}) do
      Todo.List.add_entry(
        todo_list,
        entry
      )
    end

    defp info_callback(todo_list, :done), do: todo_list
    defp info_callback(todo_list, :halt), do: :ok
  end

end