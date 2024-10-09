defmodule MockIO do

  def puts(value) do
    value
  end
end

defmodule BounceTest do
  use ExUnit.Case

  test "report process" do
    # pid = spawn(Bounce, :report, [MockIO])
    pid = spawn(Bounce, :report, [IO, 1])
    send(pid, 123)
    assert true
    send(pid, 456)
  end

  test "use process name" do
    pid = spawn(Bounce, :report, [IO, 1])
    Process.register(pid, :bounce)
    send(:bounce, :hello)
    assert true
  end

  test "where is and unregister" do
    pid = spawn(Bounce, :report, [IO, 1])
    Process.register(pid, :name)
    assert pid == Process.whereis(:name)
    Process.unregister(:name)
    assert nil == Process.whereis(:name)
    send(pid, "Still Where?")
    assert true
  end
end
