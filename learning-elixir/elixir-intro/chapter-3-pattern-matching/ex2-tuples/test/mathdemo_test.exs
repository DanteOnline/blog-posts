defmodule MathDemoTest do
  use ExUnit.Case

  test "test abs" do
    assert 10 == MathDemo.absolute_value(10)
    assert 10 == MathDemo.absolute_value(-10)
    assert 0 == MathDemo.absolute_value(0)
  end

end
