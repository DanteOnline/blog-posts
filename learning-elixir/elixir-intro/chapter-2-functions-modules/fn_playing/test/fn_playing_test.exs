defmodule FnPlayingTest do
  use ExUnit.Case

  test "fall velocity" do
    fall_velocity = fn (distance) -> :math.sqrt(2 * 9.8 * distance) end
    assert 19.79898987322333 == fall_velocity.(20)
    assert 62.609903369994115 == fall_velocity.(200)
    assert 197.9898987322333 == fall_velocity.(2000)

    f = fn (distance) ->
      :math.sqrt(2 * 9.8 * distance)
    end

    assert fall_velocity.(20) == f.(20)

    mps_to_mph = fn mps -> 2.23693629 * mps end

    assert 44.289078952755766 == mps_to_mph.(19.79898987322333)

    mps_to_kph = fn(mps) -> 3.6 * mps end

    assert 71.27636354360399 == mps_to_kph.(19.79898987322333)

    assert 712.76363543604 == mps_to_kph.(fall_velocity.(2000))
  end

  test "& operator" do
    fall_velocity = &(:math.sqrt(2 * 9.8 * &1))
    assert 19.79898987322333 == fall_velocity.(20)
  end
end
