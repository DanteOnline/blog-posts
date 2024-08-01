defmodule Todo.System do
  use Supervisor

  def start_link() do
    Supervisor.start_link(
      [
        Todo.Database,
        Todo.Cache
      ],
      strategy: :one_for_one
    )
  end

  def init(_) do
    Supervisor.init([Todo.Cache], strategy: :one_for_one)
  end
end
