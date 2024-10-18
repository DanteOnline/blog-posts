defmodule LogicTest do
  use ExUnit.Case
  require Logic

  test "unless" do
    Logic.unless (1 == 2) do
      assert true
    end
  end
  
end
