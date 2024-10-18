defmodule FunctionMakerTest do
  use ExUnit.Case

  test "create multiplier" do
    assert 36 == Multiply.example()
  end

end
