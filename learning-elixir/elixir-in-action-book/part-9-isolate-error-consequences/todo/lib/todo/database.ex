defmodule Todo.Database do
  @pool_size 3
  @db_folder "./persist"

  def start_link() do
    IO.puts("Starting ToDo.Database")
    File.mkdir_p!(@db_folder)
    children = Enum.map(1..@pool_size, &worker_spec/1)
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp worker_spec(worker_id) do
    default_worker_spec = {Todo.DatabaseWorker, {@db_folder, worker_id}}
    Supervisor.child_spec(default_worker_spec, id: worker_id)
  end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end

  def store(key, data) do
    key
    |> choose_worker()
    |> Todo.DatabaseWorker.store(key, data)
  end

  def get(key) do
    key
    |> choose_worker()
    |> Todo.DatabaseWorker.get(key)
  end

  # def init(_) do
  #   {:ok, first_worker_pid} = Todo.DatabaseWorker.start_link('first_storage')
  #   {:ok, second_worker_pid} = Todo.DatabaseWorker.start_link('second_storage')
  #   {:ok, third_worker_pid} = Todo.DatabaseWorker.start_link('third_storage')
  #   pids = %{
  #     0 => first_worker_pid,
  #     1 => second_worker_pid,
  #     2 => third_worker_pid
  #   }

  #   {:ok, pids}
  # end

  def choose_worker(key) do
    :erlang.phash2(key, @pool_size) + 1
  end

  # def handle_cast({:store, key, data}, pids) do
  #   worker_pid = choose_worker(pids, key)
  #   Todo.DatabaseWorker.store(worker_pid, key, data)
  #   {:noreply, pids}
  # end

  # def handle_call({:get, key}, _, pids) do
  #   worker_pid = choose_worker(pids, key)
  #   data = Todo.DatabaseWorker.get(worker_pid, key)
  #   {:reply, data, pids}
  # end

end
