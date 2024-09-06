defmodule FirstAppTest do
  use ExUnit.Case

  test "iex" do
    assert 2 + 2 == 4
    assert 27 - 14 == 13
    assert 35 * 42023943 == 1470838005
    assert 32 == 4 * (3 + 5)
    assert 13.333333333333334 == 200 / 15
  end

  test "math" do
    assert 13 == div(200,15)
    assert 5 == rem(200,15)
    assert 5 == rem 200, 15
    assert 13 == round 200/15
    assert 0.0 == :math.sin(0)
    assert -1.0 == :math.cos(:math.pi())
    assert 1.0 == :math.cos(2 * :math.pi())
    assert 65536.0 == :math.pow(2,16)
  end

  test "variables" do
    distance = 20; gravity = 9.8
    assert distance == 20; assert gravity == 9.8
  end
end
