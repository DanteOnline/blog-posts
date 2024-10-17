defmodule DropServer do
  use GenServer

  defmodule State do
    defstruct count: 0
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  def init([]) do
    {:ok, %State{}}
  end

  def handle_call(distance, _from, state) do
    reply = {:ok, Drop.fall_velocity(distance)}
    new_state = %State{count: state.count + 1}
    {:reply, reply, new_state}
  end

  def handle_cast(_msg, state) do
    IO.puts("So far, calculated #{state.count} velocities")
    {:noreply, state}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end

end
