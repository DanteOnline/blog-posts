defmodule MphDropTest do
  use ExUnit.Case

  test "mph_drop" do
    pid = spawn(MphDrop, :mph_drop, [])
    send(pid, {:moon, 10})
    assert true
  end

  test "mph_drop failed" do
    pid = spawn(MphDrop, :mph_drop, [])
    send(pid, {:moon, "some error data"})
    assert true
  end
end
