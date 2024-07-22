defmodule Todo.Database do
  use GenServer

  @db_folder "./persist"

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def store(key, data) do
    GenServer.cast(__MODULE__, {:store, key, data})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def init(_) do
    {:ok, first_worker_pid} = Todo.DatabaseWorker.start('first_storage')
    {:ok, second_worker_pid} = Todo.DatabaseWorker.start('second_storage')
    {:ok, third_worker_pid} = Todo.DatabaseWorker.start('third_storage')
    pids = %{
      0 => first_worker_pid,
      1 => second_worker_pid,
      2 => third_worker_pid
    }

    {:ok, pids}
  end

  def choose_worker(pids, key) do
    worker_id = :erlang.phash2(key, 3)
    Map.get(pids, worker_id)
  end

  def handle_cast({:store, key, data}, pids) do
    worker_pid = choose_worker(pids, key)
    Todo.DatabaseWorker.store(worker_pid, key, data)
    {:noreply, pids}
  end

  def handle_call({:get, key}, _, pids) do
    worker_pid = choose_worker(pids, key)
    data = Todo.DatabaseWorker.get(worker_pid, key)
    {:reply, data, pids}
  end

end
