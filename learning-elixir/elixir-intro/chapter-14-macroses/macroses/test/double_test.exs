defmodule DoubleTest do
  use ExUnit.Case
  require Double

  test "double" do
    assert 10 == Double.double(5)
    assert 10 == Double.simple_double(5)
  end
end
