defmodule DropTest do
  use ExUnit.Case

  test "test atoms" do
    assert 19.79898987322333 == Drop.fall_velocity(:earth, 20)
    assert 8.0 == Drop.fall_velocity(:moon, 20)
    assert 12.181953866272849 == Drop.fall_velocity(:mars, 20)
  end

  test "test variable" do
    earth = :earth
    assert 19.79898987322333 == Drop.fall_velocity(earth, 20)
  end

  test "test guards" do
    assert_raise FunctionClauseError, fn -> Drop.fall_velocity(:earth, -10) end
  end

  test "test velocity characteristic" do
    assert :stable == Drop.velocity_characteristic(:moon, 0)
    assert :slow == Drop.velocity_characteristic(:moon, 1)
    assert :moving == Drop.velocity_characteristic(:moon, 10)
    assert :fast == Drop.velocity_characteristic(:moon, 40)
    assert :speedy == Drop.velocity_characteristic(:moon, 200)
  end
end
