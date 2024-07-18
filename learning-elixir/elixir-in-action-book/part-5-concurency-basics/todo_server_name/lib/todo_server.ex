defmodule TodoServer do
  def start() do
    pid = spawn(fn -> loop(TodoList.new()) end)
    Process.register(pid, :todo_server)
    pid
  end

  defp loop(todo_list) do
    new_todo_list =
      receive do
        message -> process_message(todo_list, message)
      end
    loop(new_todo_list)
  end

  def add_entry(new_entry) do
    send(:todo_server, {:add_entry, new_entry})
  end

  def update_entry(entry_id, updater_fun) do
    send(:todo_server, {:update_entry, entry_id, updater_fun})
  end

  def delete_entry(entry_id) do
    send(:todo_server, {:delete_entry, entry_id})
  end

  defp process_message(todo_list, {:delete_entry, entry_id}) do
    TodoList.delete_entry(todo_list, entry_id)
  end

  defp process_message(todo_list, {:add_entry, new_entry}) do
    TodoList.add_entry(todo_list, new_entry)
  end

  defp process_message(todo_list, {:update_entry, entry_id, updater_fun}) do
    TodoList.update_entry(todo_list, entry_id, updater_fun)
  end

  defp process_message(todo_list, {:entries, caller, date}) do
    send(caller, {:todo_entries, TodoList.entries(todo_list, date)})
    todo_list
  end

  def entries(date) do
    send(:todo_server, {:entries, self(), date})

    receive do
      {:todo_entries, entries} -> entries
    after
      500 -> {:error, :timeout}
    end

  end

end

defmodule TodoList do

  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
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

  defp find_entry(todo_list, entry_id) do
    Map.fetch(todo_list.entries, entry_id)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case find_entry(todo_list, entry_id) do
      :error -> todo_list
      {:ok, old_entry} ->
        new_entry = %{} = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do
    case find_entry(todo_list, entry_id) do
      :error -> todo_list
      {:ok, old_entry} ->
        new_entries = Map.delete(todo_list.entries, entry_id)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  defimpl Collectable, for: TodoList do

    def into(original) do
      {original, &info_callback/2}
    end

    defp info_callback(todo_list, {:cont, entry}) do
      TodoList.add_entry(
        todo_list,
        entry
      )
    end

    defp info_callback(todo_list, :done), do: todo_list
    defp info_callback(todo_list, :halt), do: :ok
  end

end
