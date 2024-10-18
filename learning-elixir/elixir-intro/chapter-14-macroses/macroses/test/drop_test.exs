defmodule DropTest do
  use ExUnit.Case

  test "drop" do
    assert 19.79898987322333 == Drop.earth_drop(20)
    assert 8.0 == Drop.moon_drop(20)
  end
end
