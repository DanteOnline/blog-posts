defmodule TodoServer do
  use GenServer

  def start do
    GenServer.start(TodoServer, nil)
  end

  def init(_) do
    {:ok, TodoList.new()}
  end

  def add_entry(todo_server, new_entry) do
    GenServer.cast(todo_server, {:add_entry, new_entry})
  end

  def update_entry(todo_server, entry_id, updater_fun) do
    GenServer.cast(todo_server, {:update_entry, entry_id, updater_fun})
  end

  def delete_entry(todo_server, entry_id) do
    GenServer.cast(todo_server, {:delete_entry, entry_id})
  end

  @impl GenServer
  def handle_cast({:delete_entry, entry_id}, state) do
    {:noreply, TodoList.delete_entry(state, entry_id)}
  end

  @impl GenServer
  def handle_cast({:add_entry, new_entry}, state) do
    {:noreply, TodoList.add_entry(state, new_entry)}
  end

  @impl GenServer
  def handle_cast({:update_entry, entry_id, updater_fun}, state) do
    {:noreply, TodoList.update_entry(state, entry_id, updater_fun)}
  end

  @impl GenServer
  def handle_call({:entries, date},_, state) do
    {:reply, TodoList.entries(state, date), state}
  end

  def entries(todo_server, date) do
    GenServer.call(todo_server, {:entries, date})
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
