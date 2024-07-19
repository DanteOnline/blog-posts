defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {:call, request, caller} ->
        {response, new_state} =
          callback_module.handle_call(
            request,
            current_state
          )

        send(caller, {:response, response})
        loop(callback_module, new_state)
      {:cast, request} ->
        new_state =
          callback_module.handle_cast(
            request,
            current_state
          )
        loop(callback_module, new_state)
    end

  end

  def cast(server_pid, request) do
    send(server_pid, {:cast, request})
  end

  def call(server_pid, request) do
    send(server_pid, {:call, request, self()})
    receive do
      {:response, response} ->
        response
    end

  end
end

defmodule TodoServer do
  def start do
    ServerProcess.start(TodoServer)
  end

  def init do
    TodoList.new()
  end

  def add_entry(todo_server, new_entry) do
    #send(todo_server, {:add_entry, new_entry})
    ServerProcess.cast(todo_server, {:add_entry, new_entry})
  end

  def update_entry(todo_server, entry_id, updater_fun) do
    #send(todo_server, {:update_entry, entry_id, updater_fun})
    ServerProcess.cast(todo_server, {:update_entry, entry_id, updater_fun})
  end

  def delete_entry(todo_server, entry_id) do
    #send(todo_server, {:delete_entry, entry_id})
    ServerProcess.cast(todo_server, {:delete_entry, entry_id})
  end

  def handle_cast({:delete_entry, entry_id}, state) do
    TodoList.delete_entry(state, entry_id)
  end

  def handle_cast({:add_entry, new_entry}, state) do
    TodoList.add_entry(state, new_entry)
  end

  def handle_cast({:update_entry, entry_id, updater_fun}, state) do
    TodoList.update_entry(state, entry_id, updater_fun)
  end

  def handle_call({:entries, date}, state) do
    {TodoList.entries(state, date), state}
  end

  def entries(todo_server, date) do
    ServerProcess.call(todo_server, {:entries, date})
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
