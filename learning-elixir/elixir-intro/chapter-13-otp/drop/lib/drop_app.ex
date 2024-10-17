defmodule DropApp do
  use Application

  def start(_type, _args) do
    IO.puts("Starting the app...")
    DropSupervisor.start_link()

  end
end
