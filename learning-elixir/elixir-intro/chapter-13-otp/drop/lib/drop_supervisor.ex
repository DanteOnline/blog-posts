defmodule DropSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  @impl true
  def init([]) do
    # child = [worker(DropServer, [], [])]
    # supervise(
    #   child,
    #   [{:strategy, :one_for_one}, {:max_restarts, 1}, {:max_seconds, 5}]
    # )

    children = [DropServer]

    Supervisor.init(children, [{:strategy, :one_for_one}, {:max_restarts, 1}, {:max_seconds, 5}])

  end
end
