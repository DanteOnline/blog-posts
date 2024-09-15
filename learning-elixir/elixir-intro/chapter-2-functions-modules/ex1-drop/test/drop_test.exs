defmodule DropTest do
  use ExUnit.Case

  test "fall velocity" do
    fall_velocity = fn (distance) -> Drop.fall_velocity(distance) end
    assert 19.79898987322333 == fall_velocity.(20)
    assert 62.609903369994115 == fall_velocity.(200)
    assert 197.9898987322333 == fall_velocity.(2000)

    f = &Drop.fall_velocity/1

    assert fall_velocity.(20) == f.(20)

    mps_to_mph = fn mps -> Drop.mps_to_mph(mps) end

    assert 44.289078952755766 == mps_to_mph.(19.79898987322333)

    mps_to_kph = &Drop.mps_to_kph/1

    assert 71.27636354360399 == mps_to_kph.(19.79898987322333)

    assert 712.76363543604 == mps_to_kph.(fall_velocity.(2000))
  end

end
