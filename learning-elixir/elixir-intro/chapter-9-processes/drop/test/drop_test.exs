defmodule DropTest do
  use ExUnit.Case

  test "drop" do
    pid = spawn(Drop, :drop, [])
    send(pid, {self(), :moon, 10})

    receive do
      response ->
        assert {:moon, 10, 5.656854249492381} == response
    end

  end
end
