defmodule CountTest do
  use ExUnit.Case

  test "test factorial" do
    assert 1 == Count.factorial(1)
    assert 2 == Count.factorial(2)
    assert 6 == Count.factorial(3)
    assert 815915283247897734345611269596115894272000000000 == Count.factorial(40)
  end

end
