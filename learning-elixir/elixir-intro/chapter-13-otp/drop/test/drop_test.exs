defmodule DropTest do
  use ExUnit.Case

  test "fall velocity" do
    assert 0 == Drop.fall_velocity(0)
    assert 14 == Drop.fall_velocity(10)
  end

end
