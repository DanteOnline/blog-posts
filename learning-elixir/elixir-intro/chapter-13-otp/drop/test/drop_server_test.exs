defmodule DropServerTest do
  use ExUnit.Case

  test "handle call" do
    # DropServer.start_link()
    DropSupervisor.start_link()
    assert {:ok, 0} == GenServer.call(DropServer, 0)
    pid = Process.whereis(DropServer)
    Process.exit(pid, :for_test)
    :timer.sleep(5000)
    assert {:ok, 0} == GenServer.call(DropServer, 0)
  end

end
